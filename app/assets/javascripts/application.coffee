#= require jquery
#= require jquery_ujs
# require turbolinks
#= require bootstrap-sprockets
#= require js-routes

# Vendor libs
#= require swiper.jquery.min
#= require jquery.infinite-pages

#= require social
#= require welcome

$(document).ready ->
  doc = $(document)

  $('.infinite-songs').infinitePages
    # debug: true
    # buffer: 200
    loading: ->
      $(this).text('Loading next page...')
    error: ->
      $(this).button('There was an error, please try again')

  doc.on 'click', '.holder-sort-by a.sort-menu', ->
    $(this).parent().find('ul.options').slideToggle('fast')
    false

  doc.on 'click', 'a.categories-menu', ->
    console.log 1
    $('.container-categories .holder-categories-filter').slideToggle('fast')
    false
