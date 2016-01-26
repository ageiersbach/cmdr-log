// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
"use strict";
$(document).ready(function() {
  $('.row').on('ajax:complete', '.entry-add-item', function(evt, response) {
    $('.mining-entry').html(response.responseText);
  });
});

