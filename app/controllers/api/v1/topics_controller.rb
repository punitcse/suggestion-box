module Api::V1
  class TopicsController < ActionController::API
    before_action :authenticate!, except: [:submit_feedback]
    before_action :find_topic, only: [:submit_feedback]

    def submit_feedback
      if @topic.update(feedback_params)
        head :ok
      else
        render json: @topic.errors.full_messages, status: 422
      end
    end

    def index
      @topics = Topic.retrieve_topic_details(params)
      render json: @topics
    end

    private

    def find_topic
      @topic ||= Topic.find(params[:id])
    end

    def feedback_params
      params.permit(:id, questions_attributes: [:id, answers_attributes: [:content, :rating]])
    end
  end
end
