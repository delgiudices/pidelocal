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

  $('input[name=order\\[shipping_address\\]]').change ->
    selected_val = $('input[name=order\\[shipping_address\\]]:checked').val()
    query_address = '/api/shipping_addresses/fee?location=' +  selected_val
    $.get query_address, (data) ->
      subtotal_fee = parseFloat($("#subtotal_fee").html().substring(1))
      shipping_fee = data.fee
      $('#shipping_fee').html('$' + shipping_fee.toFixed(2))
      tax_fee = (subtotal_fee + shipping_fee) * 0.18
      $('#tax_fee').html('$' + tax_fee.toFixed(2))
      total_fee = subtotal_fee + shipping_fee + tax_fee
      $('#total_fee').html('$' + total_fee)

  $('#review_order_button').click ->
    $('#payment-form').submit()

    


root = exports ? this
root.refresh_item = refresh_item
root.delete_item = delete_item
