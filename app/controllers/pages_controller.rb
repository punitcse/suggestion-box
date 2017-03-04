class PagesController < ApplicationController
  before_action :authenticate!, only: [:topics]

  def home; end

  def topics; end
end
