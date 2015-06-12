class Song < ActiveRecord::Base
  before_validation :prepare

  belongs_to :user
  belongs_to :category
  has_many :votes, dependent: :destroy

  mount_uploader :image, SongImageUploader

  validates :user, :category, :url, :provider, :provider_id, presence: true

  scope :latest, -> { order(created_at: :desc) }
  scope :top, -> { select('`songs`.`votes_count` + `songs`.`plays` AS `songs_score`, `songs`.*').order('`songs_score` DESC') }

  def play
    increment! :plays
  end

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
