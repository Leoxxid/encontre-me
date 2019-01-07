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
//= require angular

$(document).on('turbolinks:load', function() {
  $('.dropdown-trigger').dropdown();
  $('.sidenav').sidenav();
  $('.tabs').tabs();
  $('.owl-carousel').owlCarousel({
    items:1,
    margin:10,
    autoHeight:true
  });
});


$(document).on('nested-fields:load', function() {
  $('select').formSelect();
});

var app = angular.module('chatApp', ['firebase']);

app.controller('ChatController', function($scope, $firebaseArray) {
    var ref = firebase.database().ref().child('messages');
    $scope.messages = $firebaseArray(ref);

    $scope.send = function() {
        $scope.messages.$add({
            message: $scope.messageText,
            date: Date.now()
        })
    }

})
