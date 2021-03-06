Template.newTodo.helpers
  todos: ->
    Todos.find({noteId: Session.get "activeNoteId"})

Template.newTodo.events
  "keypress #new-todo":(e,t) ->
    if e.which is 13
      todo = t.$(e.currentTarget).val().trim()
      noteId = Session.get "activeNoteId"
      Todos.insert
        text: todo
        checked: false
        createdAt: new Date()
        noteId: noteId
        owner: Meteor.userId()
      t.$(e.currentTarget).val('')
        
        
  "keypress #title":(e,t)->
    if e.which is 13
      title = t.$('#title').val().trim()
      noteId = Session.get "activeNoteId"
      Notes.update(noteId, {$set: {title: title}})



  "focus .edit-todo": (e,t)->
    t.$('.'+@_id+"-todo-item").addClass("editing")
    
  "blur .edit-todo": (e,t)->
    t.$('.'+@_id+"-todo-item").removeClass("editing")
    text = t.$(e.currentTarget).val()
    Todos.update(@_id, {$set: {text: text}})

  
  'click .new-checkbox':(e,t) ->
    Todos.update(@_id,{$set: {checked: !@checked}})

  'click .remove-todo': (e,t)->
    Todos.remove(@_id)
