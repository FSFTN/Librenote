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

  selectedNotes: ->
    noteIds = Session.get "selectedNotes"
    if noteIds.length > 0
      true
    else
      false

  selectedNotesCount: ->
    noteIds = Session.get "selectedNotes"
    noteIds.length



Template.sideNav.events
  "click #slide-out a":(e,t) ->
    $('.button-collapse').sideNav('hide')
    text =  $(e.currentTarget).text().trim()
    Session.set "activeTemplate", text


  "click .clear-selected":(e,t)->
    Session.set "selectedNotes", []
    $('.note-block').removeClass('selected')

  "click .delete-selected":(e,t)->
    noteIds = Session.get "selectedNotes"
    Meteor.call("trashMultipleNotes", noteIds, (err,res)->
      if err
        console.log err
      else
        Materialize.toast('Moved to Trash', 1500)
        Session.set "selectedNotes", []
    )

  "click .archive-selected":(e,t)->
    noteIds = Session.get "selectedNotes"
    Meteor.call("archiveMultipleNotes", noteIds, (err,res)->
      if err
        console.log err
      else
        Materialize.toast('Moved to Archive', 1500)
        Session.set "selectedNotes", []
    )
  
  "click .hello":()->
    $('.button-collapse').sideNav('show')
