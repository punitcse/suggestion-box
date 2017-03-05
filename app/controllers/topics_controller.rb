class TopicsController < ApplicationController
  before_action :authenticate!

  def edit
    @topic = Topic.find(params[:id])
    @topic.questions.each do |question|
      question.answers.build
    end
  end
end
