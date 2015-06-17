# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  doc = $(document)

  if $('.swiper-container').length > 0
    mySwiper = new Swiper('.swiper-container',
      loop: true
      keyboardControl: true
      nextButton: '.swiper-button-next'
      prevButton: '.swiper-button-prev')

  doc.on 'submit', 'form#new_song', ->
    $('#new_song input').prop("disabled", true)
    $('#modal-upload').modal('hide')

  doc.on 'click', 'article.music-item a.play-song', ->
    event.preventDefault()

    provider = $(this).data('provider')
    providerID = $(this).data('provider-id')
    songID = $(this).data('song-id')
    timeKey = 'd2'+songID

    $('article.music-item .overlay').removeClass('active')
    $(this).parents('article.music-item').find('.overlay').addClass('active')

    $.get Routes.play_song_path(songID)

  doc.on 'click', '#player a.close-player', ->
    $('#player').fadeOut()
    setTimeout (->
      $('#player').html ''
      return
    ), 500
    false

$(window).resize ->
  if $('.swiper-container').length > 0
    height = $(window).height() - $("#footer").height() - $("#header").height()
    width = $(window).width()
    $('.swiper-container, .swiper-slide').height height
    $('.swiper-container, .swiper-slide').width width
    #Add reInit, because jQuery's resize event handler may occur earlier than Swiper's one
    # mySwiper.reInit()

    $.each $('.swiper-slide'), (key, item) ->
      slide = $(item)
      content = $(slide.find('.holder-slide-content'))
      marginValue = (slide.height()-content.height()) / 2

      content.css('margin-top', marginValue + "px")



$(window).resize()


