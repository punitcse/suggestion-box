module Api::V1
  class TopicsController < ApplicationController
    before_action :authenticate!, except: [:submit_feedback, :create]
    authenticate_roles({only: [:create]}, :admin)
    before_action :find_topic, only: [:submit_feedback]
    before_action :validate_feedback_identifier, only: [:submit_feedback]

    def create
      @topic = Topic.new(topic_params)
      if @topic.save
        render json: @topic.to_json
      else
        render json: @topic.errors.full_messages, status: 422
      end
    end

    def submit_feedback
      if @topic.update(feedback_params)
        render json: { message: 'Feedback submitted successfully.' }
      else
        render json: @topic.errors.full_messages, status: 422
      end
    end

    def graph
      render json: topic.graph_details
    end

    def index
      @topics = Topic.retrieve_topic_details(params)
      render json: @topics
    end

    private

    def find_topic
      @topic ||= Topic.find(params[:id])
    end

    def validate_feedback_identifier
      unless @topic.feedback_identifiers.exists?(token: params[:feedback_token])
        render json: { message: 'You need valid identifier to submit review.' }, status: 422
      end
    end

    def topic_params
      params.require(:topic).permit(:name, :rating_scale, :description, :expiry_date)
    end

    def feedback_params
      params.require(:topic).permit(:id, questions_attributes: [:id, answers_attributes: [:content, :rating]])
    end
  end
end
