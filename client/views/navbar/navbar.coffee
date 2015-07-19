Template.navbar.events
  "click .logout":() ->
    Meteor.logout()	
    Router.go '/'


