class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  include CoreBox::Authentication

  helper_method :current_person
end
