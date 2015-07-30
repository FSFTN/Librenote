Router.configure
  loadingTemplate: 'loading',
  notFoundTemplate: 'notFound',

Router.onBeforeAction ()->
  if !Meteor.userId()
    Router.go 'signin'
    @render 'signin'
  else
    @next()
 ,
  except: ['signup']

SigninController = RouteController.extend
  onRun: () ->
    if Accounts._resetPasswordToken
      Session.set 'resetToken', Accounts._resetPasswordToken
    @next()
  

  
Router.route '/', ->
  name: 'home'
  @wait(Meteor.subscribe('notes', Session.get "searchValue"))
  if @ready
    @render 'home'
  else
    @render 'loading'
  @layout "applicationLayout"

Router.route '/signin',
  name: 'signin'
  template: 'signin'
  layout: 'registrationLayout'
  controller: SigninController

Router.route '/signup', ->
  @render 'signup'
  @layout "registrationLayout"

Router.route '/trash', ->
  @render 'trash'
  @layout "applicationLayout"

Router.route '/archive', ->
  @render 'archive'
  @layout "applicationLayout"
