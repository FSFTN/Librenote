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
    if e.which is 13
      t.$('#signin-btn').trigger('click')

  "click .btn-forgot":(e,t)->
    t.$('.fg-password-container').fadeToggle()

  "click #btn-forgot-mail":(e,t)->
    email = t.$('#forgot-mail').val().trim()
    re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i
    if email is "" or re.test(email) is false
      Materialize.toast('Please provide a valid email address', 1500)
    else
      t.$("#btn-forgot-mail").text('Sending...')
      t.$('#forgot-mail').prop('disabled', true)
      Accounts.forgotPassword({email: email}, (error)->
        if error
          Materialize.toast(error.reason, 1500)
          t.$('#forgot-mail').prop('disabled', false)
          t.$("#btn-forgot-mail").text('Send')
        else
          t.$('#forgot-mail').val('').prop('disabled', false)
          t.$("#btn-forgot-mail").text('Send')
          Materialize.toast("Mail sent successfully", 1500)
          t.$('.fg-password-container').fadeToggle()
      )

  "keypress #forgot-mail":(e,t)->
    if e.which is 13
      t.$('#btn-forgot-mail').trigger('click')

