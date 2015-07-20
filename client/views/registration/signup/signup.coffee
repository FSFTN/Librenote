Template.signup.events
  "click .github-btn": ()->
    Meteor.loginWithGithub
      requestPermissions:["user"]
      requestOfflineToken:true
      , (error) ->
        if error
          console.log error.reason 
        else
          Router.go "/"

  "click #signup-btn": (e,t)->
    e.preventDefault()	
    email = t.$("#email").val()
    password = t.$("#password").val()
    password2 = t.$("#confirm-password").val()
    if email isnt "" and password is password2
      Accounts.createUser({email: email,password: password},(error,response)->
        if error
          console.log error
        else
          Router.go "/"
         
    )

  "keypress #email, keypress #confirm-password": (e,t)->
    email = t.$("email").val()
    password = t.$("password").val()
    password2 = t.$("#confirm-password").val()
    if e.which is 13 and email and password is password2
      t.$('#signup-btn').trigger('click')
