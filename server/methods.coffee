Meteor.methods
  clearTrash: () ->
    Notes.remove({owner: @userId, trash: true})
    true
