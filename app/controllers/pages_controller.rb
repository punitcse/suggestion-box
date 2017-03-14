class PagesController < ApplicationController
  before_action :authenticate!, only: [:topics]

  def home
    @topics = Topic.unexpired
  end

  def topics; end
end
