class Admin::QuestionsController < Admin::ApplicationController
  before_action :find_topic

  def new
    @question = @topic.questions.new
  end

  def create
    @question = @topic.questions.new(question_params)

    if @question.save
      flash[:notice] = 'Question successfully created'
      redirect_to admin_topic_questions_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    if @question.update(question_params)
      flash[:notice] = 'Question successfully updated'
      redirect_to admin_topic_questions_paths
    else
      render :edit
    end
  end

  def index
    @questions = Question.all
  end

  private

  def find_topic
    @topic ||= Topic.find(params[:topic_id])
  end

  def question_params
    params.require(:question).permit(:content, :question_type_cd)
  end
end
