subs = new SubsManager({cacheLimit: 100, expireIn: 864000})
Tracker.autorun ->
  Meteor.subscribe('notes', Session.get "searchValue")
  Meteor.subscribe('todos', Session.get "searchValue")
