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

Router.route '/', ->
  name: 'home'
  @render 'home'
  @layout "applicationLayout"

Router.route '/signin', ->
  @render 'signin'
  @layout "registrationLayout"

Router.route '/signup', ->
  @render 'signup'
  @layout "registrationLayout"

Router.route '/trash', ->
  @render 'trash'
  @layout "applicationLayout"

Router.route '/archive', ->
  @render 'archive'
  @layout "applicationLayout"
