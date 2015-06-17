$('#player').hide()
$('#player').html "<%= escape_javascript(render partial: 'application/player', locals: {song: @song}) %>"

setTimeout (->
  $('#player').fadeIn()
), 500

$("article.music-item#song-item-<%= @song.id %> .plays").html "<%= @song.plays_count %>"
