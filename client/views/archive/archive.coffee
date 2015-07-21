Template.archive.helpers
  notes: ->
    Notes.find({archive: true, owner: Meteor.userId(), trash: false},{sort: {createdAt: -1} })


Template.archive.events
  "click .btn-delete":(e,t) ->
    Notes.update({_id: @._id}, {$set: trash: true, archive: false})
    Materialize.toast('Moved to Trash', 2000)


