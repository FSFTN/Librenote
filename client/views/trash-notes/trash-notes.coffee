Template.trash.helpers
  notes: ->
    if Session.get "searchValue" is ""
      Notes.find({trash: true, owner: Meteor.userId(), archive: false}, {sort: {createdAt: -1}})
    else
      Notes.find({trash: true, archive: false}, { sort: [["score", "desc"]] })

  noteCount: ->
    count = Notes.find({"trash": true, "owner": Meteor.userId()}).count()
    if count isnt 0
      true
    else
      false

Template.trash.events
  "click .btn-delete":(e,t) ->
    if confirm("Are you sure? You can not restore once deleted from trash")
      Notes.remove({_id: @._id})	

  "click .btn-restore":(e,t) ->
    Notes.update({_id: @._id}, {$set: {trash: false}})

  "click .btn-delete-all":(e,t)->
    if confirm("Are you sure? You can not restore once deleted from trash")
      Meteor.call('clearTrash')
