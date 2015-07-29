Template.editNote.helpers
  activeNote: ->
    Session.get "editNote"

  todos: ->
    note = Session.get "editNote"
    Todos.find({noteId: note._id })

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


