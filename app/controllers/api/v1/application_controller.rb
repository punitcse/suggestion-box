module Api::V1
  class ApplicationController < ::ActionController::API
    protect_from_forgery
    respond_to :json

    include CoreBox::Authentication
  end
end
