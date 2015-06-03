class Song < ActiveRecord::Base
  belongs_to :user

  mount_uploader :image, SongImageUploader
end
