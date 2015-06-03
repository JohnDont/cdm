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
    swiper.reInit()
    return

$(window).resize()


