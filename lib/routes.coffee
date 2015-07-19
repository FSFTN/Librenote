Router.configure
  layoutTemplate: 'applicationLayout',
  loadingTemplate: 'loading',
  notFoundTemplate: 'notFound',


Router.route '/', ->
  @render 'home'

Router.route '/signin', ->
  @render 'signin'

Router.route '/signup', ->
  @render 'signup'
