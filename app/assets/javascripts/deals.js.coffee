# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.best_in_place').best_in_place()


$("[data-toggle='showHide']").click (el) ->
    if (this.hasAttribute('data-target')) 
        target = $(this.getAttribute('data-target'))
    else
        target = $(this.getAttribute('href'))
    target.toggle();
