Template.listNote.helpers
  notes: ->
    if Session.get "searchValue" is ""
      Notes.find({trash: false, owner: Meteor.userId(), archive: false }, {sort: {createdAt: -1}})
    else
      Notes.find({trash: false, archive: false}, { sort: [["score", "desc"]] })

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
