class Admin::TopicsController < Admin::ApplicationController

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = 'Topic successfully created'
    else
      @errors = @topic.errors.full_messages
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :rating_scale, :description, :expiry_date)
  end
end
