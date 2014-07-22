require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "577827953460.apps.googleusercontent.com", "VMLrbcNi0swUzWJ3DSAQAPT7", {:redirect_path => "/contacts/gmail/contact_callback"}
  importer :yahoo, "dj0yJmk9VmdEZUJuRDlCOUROJmQ9WVdrOWJuTTJSVWRITjJjbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD04Nw--", "04e51e2127e2c454e8a1e1a6249f4571e7deb095", {:callback_path => '/contacts/yahoo/contact_callback'} 

	#check out the url for hotmail
	#http://msdn.microsoft.com/en-us/library/cc287659.aspx
	#https://manage.dev.live.com/Applications/ApiSettings/440d3a4c
	#http://isdk.dev.live.com/ISDK.aspx?category=scenarioGroup_hotmail&index=1
  importer :hotmail, "000000004C0FD028", "Ov9imUTR82fAH31X2loPZe0PF21W3QNu"
end