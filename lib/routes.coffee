Router.configure
  layoutTemplate: 'applicationLayout',
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
  @render 'home'

Router.route '/signin', ->
  @render 'signin'

Router.route '/signup', ->
  @render 'signup'

Router.route '/trash', ->
  @render 'trash'
