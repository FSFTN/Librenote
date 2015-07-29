 Meteor.startup ->
  process.env.MAIL_URL = Meteor.settings.development.mailurl
  Notes._ensureIndex({
    "title": "text"
    "content": "text"
  })
  Todos._ensureIndex({
    "text": "text"
  })
