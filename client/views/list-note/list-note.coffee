Template.listNote.helpers
  notes: ->
    if Session.get "searchValue" 
      Notes.find({trash: false, archive: false}, { sort: [["score", "desc"]] })
    else
      Notes.find({trash: false, owner: Meteor.userId(), archive: false }, {sort: {createdAt: -1}})

  todos:(noteId) ->
    Todos.find({noteId: noteId})

Template.listNote.events
  "click .btn-delete":(e,t) ->
    Notes.update({_id: @._id}, {$set: trash: true})
    Materialize.toast('Moved to Trash', 2000)

  "click .note-block":(e,t)->
    #event.stopPropagation() not working on checkbox so had to add this until we figure out a better fix
    if t.$(e.target).hasClass('filled-in')
      $('#edit-modal').closeModal()
    else
      Session.set "editNote", @
      $('#edit-modal').openModal()
  
  "click .btn-archive": (e,t)->
    Notes.update({_id: @._id}, {$set: archive: true})
    Materialize.toast('Note Archived', 2000)



  'click .filled-in':(e,t) ->
    Todos.update(@_id,{$set: {checked: !@checked}})



