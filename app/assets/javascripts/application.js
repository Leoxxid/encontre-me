// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require cocoon
//= require rails-ujs
//= require activestorage
//= require owlcarousel2/owl.carousel
//= require turbolinks
//= require materialize-sprockets
//= require_tree .
//= require serviceworker-companion


$('.addbutton').click(function(){
  console.log("key");
  $('select').formSelect();
});


$(document).on('turbolinks:load', function() {
  $('.dropdown-trigger').dropdown();
  $('.sidenav').sidenav();
  $('.tabs').tabs();
  $('select').formSelect();

  $('.owl-carousel').owlCarousel({
    items:1,
    margin:10,
    autoHeight:true
  });

});