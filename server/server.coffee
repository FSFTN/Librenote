 Meteor.startup ->
  process.env.MAIL_URL = Meteor.settings.development.mailurl
