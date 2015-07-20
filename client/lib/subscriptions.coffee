subs = new SubsManager({cacheLimit: 100, expireIn: 864000})
Tracker.autorun ->
  subs.subscribe('allNotes')
