module SongsHelper
  def song_meta song
    {
      og: {
        image: song.image.list.url,
        title: song.title,
        site_name: 'Caribbean Dance Music',
        url: song_url(song),
        description: song.description
      }
    }
  end
end
