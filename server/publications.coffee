Meteor.publish "allNotes", ->
  Notes.find({owner: @userId})
