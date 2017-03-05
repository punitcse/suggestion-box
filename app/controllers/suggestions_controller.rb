class SuggestionsController < ApplicationController
  before_action :authenticate!

  def new
    @suggestion = Suggestion.new
  end
end
