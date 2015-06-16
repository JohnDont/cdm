<% if request.get? %>
$('#player').hide()
$('#player').html "<%= escape_javascript(render partial: 'application/player', locals: {song: @song}) %>"

setTimeout (->
  $('#player').fadeIn()
), 500

<% elsif request.post? %>
$("article.music-item#song-item-<%= @song.id %> .plays").html "<%= @song.plays %>"
$("#player #song-player-<%= @song.id %> .plays").html "<%= @song.plays %>"
<% end %>
