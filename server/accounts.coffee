ServiceConfiguration.configurations.remove service: "github"
ServiceConfiguration.configurations.insert
  service: "github"
  clientId: Meteor.settings.development.githubClientId
  secret: Meteor.settings.development.githubSecretKey
  loginStyle: "popup"
