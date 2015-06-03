$('#modal-upload .modal-body .content').html "<%= escape_javascript(render partial: 'form', locals: {song: @song}) %>"

$('#modal-upload').modal('show')

