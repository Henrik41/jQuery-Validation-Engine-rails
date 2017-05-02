Geocoder.configure(
 :timeout => 20,
  :lookup => :bing, :api_key => 'Astd_ygIwPyTMpRFhEeosP6n4RlScOEvj1BBXuYG3wxnOdDavbq8-DEu5CBnFknw',
  :ip_lookup => :freegeoip,
  :freegeoip  => {:host => "localhost:8080"},
  :cache => Rails.cache, 
 
)
#   freegeoip: {host: "localhost:8080"},