if Meteor.isServer
  @Notes.after.remove (userId,doc)->
    Todos.remove({noteId: doc._id})
