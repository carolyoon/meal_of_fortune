$(document).ready(function() {
  var wheel = document.querySelector("#wheel"),
      button = document.querySelector("#button"),
      rando = 0; // Keep track of how many degrees to rotate

  // When we click the button...
  // Takes in a random number from 0 to 360 from the response json
  var spin_wheel = function (degrees) {

    // We want it to spin 4 times (1440 degrees) and then land somewhere, so we add 1440 to our degrees
    // We add this to the already-created "rando" variable so that we can spin the wheel multiple times.
    rando += (degrees) + 1508;

    // And spin the wheel to the random position we just generated!
    // Gotta cover ourselves with vendor prefixes.
    wheel.style.webkitTransform = "rotate(" + rando + "deg)";
    wheel.style.mozTransform = "rotate(" + rando + "deg)";
    wheel.style.msTransform = "rotate(" + rando + "deg)";
    wheel.style.transform = "rotate(" + rando + "deg)";
  }

  $("#search").on("submit", function(e) {
    e.preventDefault();
    var form = $(this)
    var url = form.attr('action')
    var method = form.attr('method')
    var data = form.serialize();
    $.ajax({
      url: url,
      type: method,
      data: data
    })
    .done(function(response) {
      console.log(response)
      spin_wheel(response.degrees)
      var link = `
        <a id="results-link" href="/search?cuisine=${response.cuisine}&location=${response.location}">Let's See What You Got!</a>
        `
      form.fadeOut(9500, function() {
        form.html(link).fadeIn(1000);
      });
    })
    .fail(function(error) {
      $('.container').before(error.responseText);
    })
    .always(function() {
      console.log("complete");
    });
  });
});




