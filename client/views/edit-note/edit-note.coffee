Template.editNote.helpers
  activeNote: ->
    Session.get "editNote"

  #todos: ->
    #note = Session.get "editNote"
    #Todos.find({noteId: note._id })

Template.editNote.events
  "click #btn-done":(e,t) ->
    title = t.$('#title').val().trim()
    currentData = Session.get "editNote"
    data = {
      title: title
      color: currentData.color
      lastModified: new Date()
    }
    if currentData.type is "text"
      content = $('#edit-note-content').text().trim()
      data.content = content
    Notes.update({_id: @._id}, {$set: data})
    $('#edit-modal').closeModal()

  "keypress #edit-note-content, keypress #title, keypress #edit-new-todo":(e,t)->
    if (e.keyCode is 13 or e.keyCode is 10) and e.ctrlKey
      t.$('#btn-done').trigger('click')

    	
  "click .colors-container a":(e,t)->
    color = $(e.currentTarget).attr('data-color').trim()
    data = Session.get "editNote"
    data.color = color
    Session.set "editNote", data

  "click #btn-back":(e,t)->
    $('#edit-modal').closeModal()

  'click .edit-checkbox':(e,t) ->
    Todos.update(@_id,{$set: {checked: !@checked}})

  'click .remove-todo': (e,t)->
    Todos.remove(@_id)

  "focus .edit-todo": (e,t)->
    t.$('.'+@_id+"-todo").addClass("editing")

  "blur .edit-todo": (e,t)->
    t.$('.'+@_id+"-todo").removeClass("editing")
    text = t.$(e.currentTarget).val()
    Todos.update(@_id, {$set: {text: text}})

  "keypress #edit-new-todo":(e,t) ->
    if e.which is 13
      todo = t.$(e.currentTarget).val().trim()
      currentNote = Session.get "editNote"
      Todos.insert
        text: todo
        checked: false
        createdAt: new Date()
        noteId: currentNote._id
        owner: Meteor.userId()
      t.$(e.currentTarget).val('')
        
        

