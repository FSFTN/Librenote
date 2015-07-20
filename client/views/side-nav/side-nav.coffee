Session.setDefault "activeTemplate", "Note"
Template.sideNav.onRendered ->
  $(".button-collapse").sideNav()

Template.sideNav.helpers
  activeTemplate: ->
    temp = Session.get "activeTemplate"
    temp.charAt(0).toUpperCase() + temp.slice(1)
  navColor: ->
    temp = Session.get "activeTemplate"
    switch temp
      when "note" then "yellow darken-2"
      when "trash" then "grey darken-2"
      else "yellow darken-2"

Template.sideNav.events
  "click .sidenav-note":() ->
    $('.button-collapse').sideNav('hide')
    Session.set "activeTemplate", "note"

  "click .sidenav-trash":() ->
    $('.button-collapse').sideNav('hide')
    Session.set "activeTemplate", "trash"


