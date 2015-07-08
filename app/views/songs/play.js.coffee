<% unless params[:song_profile] %>
$('#player').hide()
$('#player').html "<%= escape_javascript(render partial: 'application/player', locals: {song: @song}) %>"

setTimeout (->
  $('#player').fadeIn()
), 500

$("article.music-item#song-item-<%= @song.id %> .plays").html "<%= @song.plays_count %>"

<% else %>

$("body.page-songs-show #song-item-<%= @song.id %> header.header span.plays span.text").html "<%= @song.plays_count %>"

$("body.page-songs-show .music-item-detailed#song-item-<%= @song.id %> .iframe").html "<%= escape_javascript(render partial: 'songs/iframe_player', locals: {song: @song}) %>"
<% end %>
