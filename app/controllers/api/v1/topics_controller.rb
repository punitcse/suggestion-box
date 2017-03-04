module Api::V1
  class TopicsController < ActionController::API
    include CoreBox::Authentication

    before_action :authenticate!

    def create
      @topic = Topic.new(topic_params)
      if @topic.save
        render json: @topic.to_json
      else
        render json: @topic.errors.to_json, status: 422
      end
    end

    def index
      @topics = Topic.retrieve_topic_details(params)
      render json: @topics
    end

    private

    def topic_params
      params.require(:topic).permit(:name, :rating_scale, :description, :expiry_date)
    end


  end
end
