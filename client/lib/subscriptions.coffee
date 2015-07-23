subs = new SubsManager({cacheLimit: 100, expireIn: 864000})
Tracker.autorun ->
  Meteor.subscribe('allNotes', Session.get "searchValue")
