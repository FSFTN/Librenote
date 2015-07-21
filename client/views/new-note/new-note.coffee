Template.newNote.helpers
  noteColor: ->
    Session.get "noteColor"

  isAddingNote: ->
    Session.get "isAddingNote"

Template.newNote.events
  "click .note-placeholder":(e,t) ->
    Session.set "isAddingNote", true
    Meteor.setTimeout(->
      $('#text-note').focus()
    )

  "click .text-placeholder": (e,t)->
    t.$('#text-note').focus()

  "input #text-note, blur #text-note": (e,t)->
    text = t.$('#text-note').text().trim()
    if text is ""
      t.$('.text-placeholder').show()
    else
      t.$('.text-placeholder').hide()

  "click .btn-done":(e,t)->
    title = t.$('#title').val().trim()
    content = t.$('#text-note').text().trim()
    if title or content
      Notes.insert
        title: title
        content: content
        type: "text"
        color: Session.get "noteColor"
        trash: false
        archive: false
        date: Date.now()
        owner: Meteor.userId()
      Session.set "noteColor", "white"
      Session.set "isAddingNote", false

  "click .colors-container a":(e,t)->
    color = $(e.currentTarget).attr('data-color').trim()
    Session.set "noteColor", color


