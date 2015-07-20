Session.setDefault "activeTemplate", "Note"

Template.sideNav.helpers
  activeTemplate: ->
    Session.get "activeTemplate"
  navColor: ->
    temp = Session.get "activeTemplate"
    switch temp
      when "Note" then "yellow darken-2"
      when "Trash" then "grey darken-2"
      when "Archive" then "teal"
      else "yellow darken-2"

Template.sideNav.events
  "click #slide-out a":(e,t) ->
    $('.button-collapse').sideNav('hide')
    text =  $(e.currentTarget).text().trim()
    Session.set "activeTemplate", text


