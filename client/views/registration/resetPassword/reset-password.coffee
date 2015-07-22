Template.resetPassword.events
  "click  #btn-reset": (e,t) ->
    password = t.$("#reset-password").val().trim()
    password2 = t.$("#reset-confirm").val().trim()
    token = Session.get "resetToken"
    if password is password2
      Accounts.resetPassword(token, password, (error)->
        if error
          Materialize.toast(error.reason, 1500)
        else
          Session.set "resetToken", undefined
          Materialize.toast('Reset Successful. Please Sign In', 1500)
      )
    else
      Materialize.toast('Password does not match', 1500)


