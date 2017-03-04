module Api::V1
  class ApplicationController < ActionController::API
    include CoreBox::Authentication
  end
end
