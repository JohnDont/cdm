<% if @error.present? %>

<% msg = @error %>

<% else %>

$("article.music-item#song-item-<%= @song.id %> .votes").html "<%= @song.votes.size %>"
$("#player #song-player-<%= @song.id %> .votes").html "<%= @song.votes.size %>"
$("body.page-songs-show #song-item-<%= @song.id %> header.header span.votes span.text").html "<%= @song.votes.size %>"
<% msg = "Thank you for your vote!" %>

<% end %>


# setTimeout (->
#   $('#modal-upload .modal-body .content').html "<h3 class='text-center'><%= msg %></h3>"
#   $('#modal-upload').modal('show')
#   return
# ), 500
