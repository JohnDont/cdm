# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  doc = $(document)

  mySwiper = new Swiper('.swiper-container',
    loop: true
    keyboardControl: true
    nextButton: '.swiper-button-next'
    prevButton: '.swiper-button-prev')


$(window).resize ->

