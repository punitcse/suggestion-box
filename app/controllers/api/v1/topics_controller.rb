module Api::V1
  class TopicsController < ActionController::API
    before_filter :authenticate!

    def create
      @topic = Topic.new(topic_params)
      if @topic.save
        render json: @topic.to_json
      else
        render json: @topic.errors.to_json, status: 422
      end
    end

    def graph
      render json: topic.graph_details
    end

    private

    def find_topic
      Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:name, :rating_scale, :description, :expiry_date)
    end
  end
end
