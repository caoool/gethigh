# DESC
#   Meteor.startup will get called whenver meteor starts
#   only on the server. So we will put some initial
#   configurations here (account services...).
#
Meteor.startup ->

  # Configure Google Oauth services
	Accounts.loginServiceConfiguration.remove service: 'google'
	Accounts.loginServiceConfiguration.insert
		service: 'google'
		clientId: Meteor.settings.google.id
		secret: Meteor.settings.google.secret
		loginStyle: 'redirect'

  # Configure Facebook Oauth services
	Accounts.loginServiceConfiguration.remove service: 'facebook'
	Accounts.loginServiceConfiguration.insert
		service: 'facebook'
		appId: Meteor.settings.facebook.id
		secret: Meteor.settings.facebook.secret
		loginStyle: 'redirect'
