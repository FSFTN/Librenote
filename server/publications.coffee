Meteor.publish "allNotes", ->
  Notes.find({owner: @userId}, {sort: {date: -1}})
