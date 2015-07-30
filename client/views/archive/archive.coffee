Template.archive.helpers
  notes: ->
    if Session.get "searchValue"
      Notes.find({trash: false, archive: true}, { sort: [["score", "desc"]] })
    else
      Notes.find({archive: true, owner: Meteor.userId(), trash: false},{sort: {createdAt: -1} })



Template.archive.events
  "click .btn-delete":(e,t) ->
    Notes.update({_id: @._id}, {$set: trash: true, archive: false})
    Materialize.toast('Moved to Trash', 1500)

  "click .btn-restore":(e,t) ->
    Notes.update({_id: @._id}, {$set: {archive: false}})
    Materialize.toast('Note restored', 1500)

  "click .select-note":(e,t)->
    e.stopPropagation()
    t.$("#"+@_id+"-archive-note").toggleClass('selected')
    noteIds = Session.get "selectedNotes"
    index = noteIds.indexOf(@_id)
    if index > -1
      noteIds.splice(index,1)
      Session.set "selectedNotes", noteIds
    else
      noteIds.push(@_id)
      Session.set "selectedNotes", noteIds
