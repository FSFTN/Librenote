Template.newNote.helpers
  noteColor: ->
    Session.get "noteColor"

Template.newNote.events
  "click .note-placeholder":(e,t) ->
    t.$('.note-placeholder').hide()
    t.$('.note-inner').show()
    t.$('#text-note').focus()

  "input #text-note, blur #text-note": (e,t)->
    text = t.$('#text-note').text().trim()
    if text isnt ""
      t.$('.text-placeholder').hide()
    else
      $('.text-placeholder').show()

  "click .text-placeholder": (e,t)->
    t.$('.text-placeholder').hide()
    t.$('#text-note').focus()

  "click .btn-done":(e,t)->
    title = t.$('#title').val().trim()
    content = $('#text-note').text().trim()
    if title or content
      Notes.insert
        title: title
        content: content
        type: "text"
        color: Session.get "noteColor"
        trash: false
        date: Date.now()
        owner: Meteor.userId()
      t.$('#title').val('')
      $('#text-note').text('')
      t.$('.text-placeholder').show()
      t.$('.note-inner').hide()
      t.$('.note-placeholder').show()
      Session.set "noteColor", ""

  "click .colors-container a":(e,t)->
    color = $(e.currentTarget).attr('data-color').trim()
    Session.set "noteColor", color


