Router.configure
  layoutTemplate: 'applicationLayout',
  loadingTemplate: 'loading',
  notFoundTemplate: 'notFound',


Router.route '/', ->
  @render 'home'
