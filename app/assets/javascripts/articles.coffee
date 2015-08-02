# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  # Fix for null error bug when placing comment form above comments.
  $('#comment-form-fix').html($('#comment-form'))
