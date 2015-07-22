Template.signin.helpers
  resetToken: ->
    Session.get "resetToken"
Template.signin.events
  "click .github-btn": ()->
    Meteor.loginWithGithub
      requestPermissions:["user"]
      requestOfflineToken:true
      , (error) ->
        if error
          console.log error.reason 
        else
          Router.go "/"


  "click #signin-btn": (e,t)->
    e.preventDefault()	
    email = t.$("#signin-email").val()
    password = t.$("#signin-password").val()
    if email and password
      Meteor.loginWithPassword(email,password,(error)->
        if error
          Materialize.toast(error.reason, 2000)
        else
          Router.go "/"
         
      )
    else
      Materialize.toast('Email / Password may not be empty', 2000)

  "keypress #signin-email, keypress #signin-password": (e,t)->
    email = t.$("#signin-email").val()
    password = t.$("#signin-password").val()
    if e.which is 13 and email and password
      t.$('#signin-btn').trigger('click')

  "click .btn-forgot":(e,t)->
    t.$('.fg-password-container').fadeToggle()

  "click #btn-forgot-mail":(e,t)->
    email = t.$('#forgot-mail').val().trim()
    re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i
    if email is "" or re.test(email) is false
      Materialize.toast('Please provide a valid email address', 1500)
    else
      t.$('.fa-spinner').show()
      t.$('#forgot-mail').prop('disabled', true)
      Accounts.forgotPassword({email: email}, (error)->
        if error
          Materialize.toast(error.reason, 1500)
          t.$('#forgot-mail').prop('disabled', false)
          t.$('.fa-spinner').hide()
        else
          t.$('#forgot-mail').val('').prop('disabled', false)
          Materialize.toast("Mail sent successfully", 1500)
          t.$('.fa-spinner').hide()
          t.$('.fg-password-container').fadeToggle()
      )
