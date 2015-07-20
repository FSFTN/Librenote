Template.trash.helpers
  notes: ->
    Notes.find({"trash": true, "owner": Meteor.userId()})

Template.trash.events
  "click .btn-delete":(e,t) ->
    if confirm("Are you sure? You can not restore once deleted from trash")
      Notes.remove({_id: @._id})	


