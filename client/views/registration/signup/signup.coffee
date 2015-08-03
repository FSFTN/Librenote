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
    re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i
    if email is "" or re.test(email) is false
      Materialize.toast('Please provide a valid email address', 1500)
    else if password isnt password2
      Materialize.toast('Password does not match', 1500)
    else
      Accounts.createUser({email: email,password: password},(error,response)->
        if error
          Materialize.toast(error.reason, 1500)
        else
          Router.go "/"
         
      )


  "keypress #email, keypress #confirm-password": (e,t)->
    if e.which is 13
      t.$('#signup-btn').trigger('click')
