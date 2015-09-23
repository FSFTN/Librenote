 Meteor.startup ->
  Notes._ensureIndex({
    "title": "text"
    "content": "text"
  })
  Todos._ensureIndex({
    "text": "text"
  })
