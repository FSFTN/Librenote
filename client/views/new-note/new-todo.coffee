Template.newTodo.helpers
  todos: ->
    Todos.find({noteId: Session.get "activeNoteId"})

Template.newTodo.events
  "keypress #new-todo":(e,t) ->
    if e.which is 13
      todo = t.$('#new-todo').val().trim()
      noteId = Session.get "activeNoteId"
      Todos.insert
        text: todo
        checked: false
        createdAt: Date.now()
        noteId: noteId
        owner: Meteor.userId()
      t.$('#new-todo').val('')
        
        
  "keypress #title":(e,t)->
    if e.which is 13
      title = t.$('#title').val().trim()
      noteId = Session.get "activeNoteId"
      console.log title
      Notes.update(noteId, {$set: {title: title}})



  "focus .edit-todo": (e,t)->
    t.$('.'+@_id+"-todo-item").addClass("editing")
    
  "blur .edit-todo": (e,t)->
    t.$('.'+@_id+"-todo-item").removeClass("editing")

  
  'change [type=checkbox]': (e,t) ->
    checked = t.$(event.target).is(':checked')
    Todos.update(@_id,{$set: {checked: checked}})

  'click .remove-todo': (e,t)->
    Todos.remove(@_id)
