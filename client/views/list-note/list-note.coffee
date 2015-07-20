Template.listNote.helpers
  notes: ->
    Notes.find({"trash": false, "owner": Meteor.userId()})

Template.listNote.events
  "click .btn-delete":(e,t) ->
    Notes.update({_id: @._id}, {$set: trash: true})
