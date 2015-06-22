class Song < ActiveRecord::Base
  before_validation :prepare

  belongs_to :user
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_many :plays, dependent: :destroy

  mount_uploader :image, SongImageUploader

  validates :user, :category, :url, :provider, :provider_id, presence: true
  validates_uniqueness_of :provider_id, scope: :provider

  scope :latest, -> { order(created_at: :desc) }
  scope :top, ->(start_date=nil, end_date=nil) {
    if start_date.present? && end_date.present?
      select('COALESCE(v_count, 0) + COALESCE(p_count, 0) AS songs_score, songs.*')
      .joins("LEFT JOIN (
        SELECT COUNT(votes.id) AS v_count, votes.song_id as votes_song_id
        FROM votes
        WHERE (votes.created_at BETWEEN '#{start_date} 00:00:00' AND '#{end_date} 23:59:59')
        GROUP BY votes.song_id
      ) v ON v.votes_song_id = songs.id")
      .joins("LEFT JOIN (
        SELECT COUNT(plays.id) AS p_count, plays.song_id as plays_song_id
        FROM plays
        WHERE (plays.created_at BETWEEN '#{start_date} 00:00:00' AND '#{end_date} 23:59:59')
        GROUP BY plays.song_id
      ) p ON p.plays_song_id = songs.id")
      .order('songs_score DESC, songs.votes_count DESC, songs.plays_count DESC')
    else
      select('songs.votes_count + songs.plays_count AS songs_score, songs.*')
      .order('songs_score DESC, songs.votes_count DESC, songs.plays_count DESC')
    end
    }

  private
  def prepare
    return if persisted? or url.blank?

    if self.url.match 'soundcloud.com'
      client = Soundcloud.new(client_id: ENV['soundcloud_id'])

      begin
        track = client.get('/resolve', url: self.url)
      rescue Soundcloud::ResponseError => e
        self.errors.add :url, "video was not found, check your url"
        return
      end

      self.provider = 'soundcloud'
      self.provider_id = track.id
      self.title = track.title
      self.description = track.description
      self.remote_image_url = track.artwork_url.gsub('-large', '-t500x500')

    elsif self.url.match 'youtu.be|youtube.com'
      provider_id = CGI.parse(URI.parse(self.url).query)['v'].first
      client = Yourub::Client.new

      track = client.get provider_id
      unless track
        self.errors.add :url, "video was not found, check your url"
        return
      end

      self.provider = 'youtube'
      self.provider_id = track['id']
      self.title = track['snippet']['title']
      self.description = track['snippet']['description']
      self.remote_image_url = track["snippet"]["thumbnails"].values.last["url"]

    else
      self.errors.add :url, "provider not recognized"
    end
  end
end
