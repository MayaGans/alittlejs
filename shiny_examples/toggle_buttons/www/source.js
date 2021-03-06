$( document ).ready(function() {
  Shiny.addCustomMessageHandler("disable", function(params) {
  $el = $("#" + params.input_id);
  $el.prop("disabled", true);
  $el.addClass("disabled");
});

Shiny.addCustomMessageHandler("enable", function(params) {
  $el = $("#" + params.input_id);
  $el.prop("disabled", false);
  $el.removeClass("disabled");
});
});