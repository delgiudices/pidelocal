# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

refresh_item = () ->
  $('<input>').attr(
    type: 'hidden'
    name: 'cart_action'
    value: 'refresh'
  ).appendTo('#cart_form')
  $("#cart_form").submit()

delete_item = () ->
  $('<input>').attr(
    type: 'hidden'
    name: 'cart_action'
    value: 'delete'
  ).appendTo('#cart_form')
  $("#cart_form").submit()

$(document).ready ->
  $('#shipping_address_phone').mask('(999) 999-9999')
  $('#cardNumber').mask('9999-9999-9999-9999')


root = exports ? this
root.refresh_item = refresh_item
root.delete_item = delete_item
