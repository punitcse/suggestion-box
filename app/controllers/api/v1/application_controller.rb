module Api::V1
  class ApplicationController < ::ActionController::API
    respond_to :json

    include CoreBox::Authentication
  end
end
