setTimeout (->
  $('#modal-upload .modal-body .content').html "<%= escape_javascript(render template: 'songs/share.html') %>"
  $('#modal-upload').modal('show')
  return
), 500


