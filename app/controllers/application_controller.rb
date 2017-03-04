class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CoreBox::Authentication

  helper_method :current_person
end
