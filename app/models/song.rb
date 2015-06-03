class Song < ActiveRecord::Base
  before_validation :prepare

  belongs_to :user

  mount_uploader :image, SongImageUploader

  private
  def prepare
    return if persisted?
    if self.url.match 'soundcloud.com'
      client = Soundcloud.new(client_id: ENV['soundcloud_id'])

      track = client.get('/resolve', url: self.url)
      self.provider = 'soundcloud'
      self.provider_id = track.id
      self.title = track.title
      self.description = track.description
      self.remote_image_url = track.artwork_url.gsub('-large', '-t500x500')
    elsif self.url.match 'youtu.be|youtube.com'

    end
  end
end
