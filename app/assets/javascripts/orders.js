// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function calculateTotal(){
  var total;
  $("#order_quantity").on("Keypress", function(){
    debugger;
    total = $("#order_quantity").val() * $("#order_payment").val();
  })
  $("#order_payment").on("change", function(){
    total = $("#order_quantity").val() * $("#order_payment").val();
  })
  alert(total);
}
