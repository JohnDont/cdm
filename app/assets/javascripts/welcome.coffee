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
    $('#modal-upload').modal('hide')


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


