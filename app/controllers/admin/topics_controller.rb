class Admin::TopicsController < Admin::ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.person = current_person

    if @topic.save
      flash[:notice] = 'Topic successfully created'
      redirect_to admin_topics_path
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    if @topic.update(topic_params)
      flash[:notice] = 'Topic successfully updated'
      redirect_to admin_topics_paths
    else
      render :edit
    end
  end

  def index
    @topics = Topic.all
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :rating_scale, :description, :expiry_date)
  end
end
