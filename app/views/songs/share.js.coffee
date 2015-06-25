setTimeout (->
  $('#modal-upload .modal-body .content').html "<%= escape_javascript(render template: 'songs/share.html') %>"
  $('#modal-upload').modal('show')
  $('body.page-welcome-index .holder-songs, body.page-users-show-<%= @song.user_id %> .holder-songs').prepend "<%= escape_javascript(render partial: 'welcome/song_item', locals: {song: @song}) %>"
  return
), 500


