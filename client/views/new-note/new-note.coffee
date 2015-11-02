Template.newNote.helpers
  noteColor: ->
    Session.get "noteColor"

  isAddingNote: ->
    Session.get "isAddingNote"

  isAddingTodo: ->
    Session.get "isAddingTodo"

Template.newNote.events
  "click .note-placeholder":(e,t) ->
    Session.set "isAddingNote", true
    Meteor.setTimeout(->
     t.$('#text-note').focus()
    )

  "click .text-placeholder": (e,t)->
    t.$('#text-note').focus()

  "input #text-note, blur #text-note": (e,t)->
    text = t.$('#text-note').html()
    if text is ""
      t.$('.text-placeholder').show()
    else
      t.$('.text-placeholder').hide()

  "keypress #text-note, keypress #title, keypress #new-todo":(e,t)->
    if (e.keyCode is 13 or e.keyCode is 10) and e.ctrlKey
      t.$('#btn-done').trigger('click')

  "click #btn-done":(e,t)->
    title = t.$('#title').val().trim()
    todo_status = Session.get "isAddingTodo"
    if todo_status
      content = ""
      id = Session.get "activeNoteId"
      type = "todo"
      count = Todos.find({noteId: id}).count()
    else
      content = t.$('#text-note').html()
      id = new Mongo.ObjectID()._str
      type = "text"
      count = 0
    if title or content or count > 0
      Notes.insert
        _id: id
        title: title
        content: content
        type: type
        color: Session.get "noteColor"
        trash: false
        archive: false
        createdAt: new Date()
        owner: Meteor.userId()
      Session.set "noteColor", "white"
      Session.set "isAddingNote", false
      Session.set "isAddingTodo", false
    else
      Materialize.toast("Title or Content may not be empty", 1500)

  "click .colors-container a":(e,t)->
    color = $(e.currentTarget).attr('data-color').trim()
    Session.set "noteColor", color

  "click .show-new-todo":(e,t)->
    e.stopPropagation()
    noteId = new Mongo.ObjectID()._str
    Session.set "isAddingTodo", true
    Session.set "isAddingNote", true
    Session.set "activeNoteId", noteId
    Meteor.setTimeout(->
      t.$('#new-todo').focus()
    )

  "click #btn-back":()->
    Session.set "isAddingTodo", false
    Session.set "isAddingNote", false
    Session.set "activeNoteId", ""
    Session.set "noteColor", "white"

