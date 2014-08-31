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

$("#deal_category_id").chosen
  create_option: (name) ->
    chosen = this
    $.post "/categories.json",
      category:
        name: name
    , (data) ->
      chosen.append_option
        value: data.id
        text: data.name

    persistent_create_option: true
