module Api::V1
  class SuggestionsController < ApplicationController
    include CoreBox::Authentication

    before_action :authenticate!

    def new
      @suggestion = Suggestion.new
    end

    def create
      @suggestion = Suggestion.new(suggestions_params)
      if suggestion.save
        render json: @suggestion
      else
        render json: @suggestion.errors.full_messages, status: 422
      end
    end

    private

    def suggestions_params
      params.require(:suggestions).permit(:description)
    end
  end
end
