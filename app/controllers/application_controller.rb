class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authenticate(user)
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      puts 'HHHHIIIIIIIII'
      user.username == username && user.password == 'password'
    end
  end
end
