class MiddlewareHealthcheck  
  OK_RESPONSE = [ 200, { 'Content-Type' => 'text/plain' }, ["It's alive!"] ]

  def initialize(app)
    #p app.inspect
    @app = app
  end

  def call(env)
    p env
    if env['PATH_INFO'] == '/healthcheck'
      return OK_RESPONSE
    else
      @app.call(env)
    end
  end
end