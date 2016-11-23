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
		# Due to some fucking issues with windows fucking not loading yml
		# clientId: Meteor.settings.google.id
		# secret: Meteor.settings.google.secret
		clientId: '118672134283-dtdgog5a78riit2njtc5jqfqth6lq71r.apps.googleusercontent.com'
		secret: 'tQELJLERjHBG-qK3mLq2vmxD'
		# Somehow link-accounts package will create new account with redirect style
		# loginStyle: 'redirect'
		loginStyle: 'popup'

  # Configure Facebook Oauth services
	Accounts.loginServiceConfiguration.remove service: 'facebook'
	Accounts.loginServiceConfiguration.insert
		service: 'facebook'
		# appId: Meteor.settings.facebook.id
		# secret: Meteor.settings.facebook.secret
		appId: '135485893564483'
		secret: '3f7c76f01bd8a53dc30e5ae4a54a1145'
		# loginStyle: 'redirect'
		loginStyle: 'popup'
