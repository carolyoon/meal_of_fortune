$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  var wheel = document.querySelector("#wheel"),
      button = document.querySelector("#button"),

    // Initialise a random number variable. As zero.
      rando = 0;

  // When we click the button...
  var spin_wheel = function (degrees) {

    // Generate a random number that'll determine how many degrees the wheel spins.
    // We want it to spin 8 times (2880 degrees) and then land somewhere, so we'll add between 0 and 360 degrees to that.
    // We add this to the already-created "rando" variable so that we can spin the wheel multiple times.
    rando += (degrees) + 360;

    // And spin the wheel to the random position we just generated!
    // Gotta cover ourselves with vendor prefixes.
    wheel.style.webkitTransform = "rotate(" + rando + "deg)";
    wheel.style.mozTransform = "rotate(" + rando + "deg)";
    wheel.style.msTransform = "rotate(" + rando + "deg)";
    wheel.style.transform = "rotate(" + rando + "deg)";
  }
  // button.addEventListener("click", spin_wheel, false);
  $("#spin").on("submit", function(e) {
    e.preventDefault();
    var form = $(this)
    var url = form.attr('action')
    var method = form.attr('method')
    console.log("hey");
    $.ajax({
      url: url,
      type: method
    })
    .done(function(response) {
      spin_wheel(response.degrees);
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });

  });
});


var wheelListener = function() {

}




