module Middleware
  class Logger
    def initialize(app)
      @app = app
    end
    
    def call(env)
      status, headers, body = @app.call(env)
      RAILS_DEFAULT_LOGGER.debug "REQUEST_HEADERS"
      env.each do |key, value|
        RAILS_DEFAULT_LOGGER.debug "#{key}: #{value}" if key =~ /^HTTP_/
      end
      [status, headers, body]
    end
  end
end
