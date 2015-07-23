Template.navbar.events
  "click .logout":() ->
    Meteor.logout()	
    Router.go '/'

  "keyup #search-field": (e,t) ->
    searchValue =  $(e.currentTarget).val()
    if searchValue.length > 2
      Session.set "searchValue", searchValue
    else
      Session.set "searchValue", "" 

  "click .close":(e,t)->
    Session.set "searchValue", "" 
    t.$("#search-field").val('')





