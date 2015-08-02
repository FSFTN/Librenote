Template.sideNav.onRendered ->
  $('.dropdown-button').dropdown({
      inDuration: 300,
      outDuration: 225,
      constrain_width: false, 
      hover: true,
      gutter: 20, 
      belowOrigin: true
    }
  )
   
Template.sideNav.helpers
  activeTemplate: ->
    Session.get "activeTemplate"

  navColor: ->
    temp = Session.get "activeTemplate"
    switch temp
      when "Notes" then "yellow darken-2"
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
    text =  $(e.currentTarget).attr('data-text')
    Session.set "activeTemplate", text


  "click .clear-selected":(e,t)->
    Session.set "selectedNotes", []
    $('.note-block').removeClass('selected')

  "click .trash-selected":(e,t)->
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

  "click .restore-selected":(e,t)->
    noteIds = Session.get "selectedNotes"
    Meteor.call("restoreMultipleNotes", noteIds, (err,res)->
      if err
        console.log err
      else
        Materialize.toast('Notes restored', 1500)
        Session.set "selectedNotes", []
    )

  "click .delete-selected":(e,t)->
    if confirm("Are you sure? You can not restore once deleted from trash")
      noteIds = Session.get "selectedNotes"
      Meteor.call("deleteMultipleNotes", noteIds, (err,res)->
        if err
          console.log err
        else
          Materialize.toast('Notes deleted forever', 1500)
          Session.set "selectedNotes", []
      )
  
  "click .colors-container a":(e,t)->
    color = $(e.currentTarget).attr('data-color').trim()
    noteIds = Session.get "selectedNotes"
    Meteor.call('updateColors',noteIds,color,(err,res)->
      if err
        console.log err
      else
        Materialize.toast('Color updated', 1500)
    )

