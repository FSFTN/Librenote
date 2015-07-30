Tracker.autorun ->
  Meteor.subscribe('notes', Session.get "searchValue")
  Meteor.subscribe('todos', Session.get "searchValue")
