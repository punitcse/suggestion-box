module Api::V1
  class AnswersController < ApplicationController
    before_action :find_question

    def create
      return unless @question

      @answer = @question.answers.new(answer_params)
      @answer.person
      if @answer.save
        render json: @answer
      else
        render json: answer.errors.full_messages
      end
    end

    private

    def find_question
      @question ||= Question.find(params[:question_id])
    end

    def answer_params
      params.require(:answers).permit(:content)
    end
  end
end
