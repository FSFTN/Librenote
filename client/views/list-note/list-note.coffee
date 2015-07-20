Template.listNote.helpers
  notes: ->
    Notes.find({"trash": false, "owner": Meteor.userId()})

Template.listNote.events
  "click .btn-delete":(e,t) ->
    t.$('.mv-trash').trigger('click')
    Notes.update({_id: @._id}, {$set: trash: true})
    Materialize.toast('Moved to Trash', 2000)

