Template.home.onRendered ->
  $(".button-collapse").sideNav();

Template.home.events
  "click .trash":() ->
    $('.button-collapse').sideNav('hide');


