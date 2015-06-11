#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets

# Vendor libs
#= require swiper.jquery.min
#= require jquery.infinite-pages

#= require social
#= require welcome

$(document).ready ->
  doc = $(document)

  $('.infinite-table').infinitePages
    # debug: true
    # buffer: 200
    loading: ->
      $(this).text('Loading next page...')
    error: ->
      $(this).button('There was an error, please try again')
