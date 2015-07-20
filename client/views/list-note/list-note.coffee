Template.listNote.helpers
  notes: ->
    Notes.find({trash: false, owner: Meteor.userId(), archive: false })

Template.listNote.events
  "click .btn-delete":(e,t) ->
    Notes.update({_id: @._id}, {$set: trash: true})
    Materialize.toast('Moved to Trash', 2000)

  "click .note-block":(e,t)->
    Session.set "editNote", @
    $('#edit-modal').openModal()
  
  "click .btn-archive": (e,t)->
    Notes.update({_id: @._id}, {$set: archive: true})
    Materialize.toast('Note Archived', 2000)
