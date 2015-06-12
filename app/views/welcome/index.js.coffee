<% if params[:reload] %>
$('body.page-welcome-index .holder-songs').html ''
$('body.page-welcome-index .music-charts a').removeClass 'active'

<% if params[:top] %>
$('body.page-welcome-index .music-charts a.top').addClass 'active'
<% else %>
$('body.page-welcome-index .music-charts a.latest').addClass 'active'
<% end %>

<% end %>


<% @songs.each do |song| %>
html = "<%= escape_javascript(render partial: 'welcome/song_item', locals: {song: song}) %>"
$('body.page-welcome-index .holder-songs').append html
<% end %>

<% if @songs.last_page? %>
$('.pagination').html("That's all, folks!");
<% else %>
$('.pagination').html("<%=j link_to_next_page(@songs, 'Next Page', remote: true, params: params.slice(:top)) %>");
<% end %>
