module Api::V1
  class SuggestionsController < ApplicationController
    before_action :authenticate!

    def create
      @suggestion = Suggestion.new(suggestions_params)
      if @suggestion.save
        render json: @suggestion
      else
        render json: {message: @suggestion.errors.full_messages.join(', ') }, status: 422
      end
    end

    private

    def suggestions_params
      params.require(:suggestion).permit(:description)
    end
  end
end
