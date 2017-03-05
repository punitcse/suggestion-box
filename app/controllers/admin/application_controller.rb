class Admin::ApplicationController < ApplicationController
  include CoreBox::Authentication

  before_action :authenticate!
end
