Geocoder.configure(

    # geocoding service:
    :lookup => :google,

    # IP address geocoding service:
    :ip_lookup => :maxmind,

    # use an API key:
    :api_key => ENV['GOOGLE_API_KEY'],

    # required for configuring geocoder with API key
    :use_https => true,

    # geocoding service request timeout, in seconds (default 3):
    :timeout => 3,

    # set default units to miles:
    :units => :mi,
)