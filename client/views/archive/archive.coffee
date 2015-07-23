Template.archive.helpers
  notes: ->
    if Session.get "searchValue" is ""
      Notes.find({archive: true, owner: Meteor.userId(), trash: false},{sort: {createdAt: -1} })
    else
      Notes.find({trash: false, archive: true}, { sort: [["score", "desc"]] })


Template.archive.events
  "click .btn-delete":(e,t) ->
    Notes.update({_id: @._id}, {$set: trash: true, archive: false})
    Materialize.toast('Moved to Trash', 2000)


