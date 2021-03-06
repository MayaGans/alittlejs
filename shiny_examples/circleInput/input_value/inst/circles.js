$( document ).ready(function() {
  $('#circles').on('click', '.circ', (ev) => {
  var circle_color = event.target.getAttribute("circle-type")
  Shiny.setInputValue('all_circles', circle_color)
})
});