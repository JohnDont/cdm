# bodyClass = "body.<%= body_class %>"

<% body_class.split(' ').each do |c| %>

bodyClass = "body.<%= c %>"
if bodyClass.length > 0
  <% if params[:reload] %>
  $(bodyClass + ' .holder-songs').html ''
  $(bodyClass + ' .music-charts a').removeClass 'active'

  <% if params[:top] %>
  $(bodyClass + ' .music-charts a.top').addClass 'active'
  <% else %>
  $(bodyClass + ' .music-charts a.latest').addClass 'active'
  <% end %>

  <% end %>


  <% @songs.each_with_index do |song, index| %>
  html = "<%= escape_javascript(render partial: 'welcome/song_item', locals: {song: song, index: index}) %>"
  $(bodyClass + ' .holder-songs').append html
  <% end %>

  <% if @songs.last_page? %>
  $(bodyClass + ' .pagination').html("That's all, folks!");
  <% else %>
  $(bodyClass + ' .pagination').html("<%=j link_to_next_page(@songs, 'Next Page', remote: true, params: params.slice(:top, :sort, :category, :for_challenge)) %>");
  <% end %>

<% end %>
