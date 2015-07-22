#Notes._ensureIndex({
    #"title": "text",
    #"content": "text"
  #})

 Meteor.startup ->
  process.env.MAIL_URL = Meteor.settings.development.mailurl
  
