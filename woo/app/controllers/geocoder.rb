Geocoder.configure(
 :timeout => 50,
  # :lookup => :bing, :api_key => 'Astd_ygIwPyTMpRFhEeosP6n4RlScOEvj1BBXuYG3wxnOdDavbq8-DEu5CBnFknw',
  :lookup => :yandex,
  :ip_lookup => :telize,
  :cache => Rails.cache, 
 
)