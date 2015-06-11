<% @songs.each do |song| %>
$('body.page-welcome-index .holder-songs').append "<%= escape_javascript(render partial: 'welcome/song_item', locals: {song: song}) %>"
<% end %>

<% if @songs.last_page? %>
$('.pagination').html("That's all, folks!");
<% else %>
$('.pagination').html("<%=j link_to_next_page(@songs, 'Next Page', :remote => true) %>");
<% end %>
