
$(document).ready(function() {
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  // Watch for a form submission:
  $("#form-submit-btn").click(function(event) {  //If they click the #for-submit-btn button
    event.preventDefault(); //Don't send anything to the server yet
    $('input[type=submit]').prop('disabled', true);
    var error = false;  
    var ccNum = $('#card_number').val(),      //Storing variables grabbing values from the fields
        cvcNum = $('#card_code').val(),        //Storing variables grabbing values from the fields
        expMonth = $('#card_month').val(),      //Storing variables grabbing values from the fields
        expYear = $('#card_year').val();         //Storing variables grabbing values from the fields
    if (!error) {            //If there are no errors
      // Get the Stripe token:
      Stripe.createToken({           //Ship info to stripe
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
      }, stripeResponseHandler);    //When stripe gets back with the token, lets run stripe ResponseHandler
    }
    return false;
  }); // form submission
  function stripeResponseHandler(status, response) {
    // Get a reference to the form:
    var f = $("#new_user");
    // Get the token from the response:
    var token = response.id;
    // Add the token to the form:
    f.append('<input type="hidden" name="user[stripe_card_token]" value="' + token + '" />');
    // Submit the form:
    f.get(0).submit(); 
  }
});