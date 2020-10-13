class QuestionsController < ApplicationController

  def new
    @survey = Survey.find(params[:id])
    @question = @survey.questions.new
    render :new
  end

  def create
    @survey = Survey.find(params[:id])
    @question = @survey.questions.new(question_params)
    if @question.save
      flash[:notice] = "Question Successfully Added!"
    else
      flash[:alert] = "There was an error while creating this question."
    end  
  end

  def edit
    @survey = Survey.find(params[:id])
    @question = Question.find(params[:id])
    render :edit
  end

  def show
    @survey = Survey.find(params[:id])
    @question = Question.find(params[:id])
    render :show
  end

  def update
    @question = Question.find(params[:id]) 
    if @question.update(question_params)
      flash[:notice] = "Question Updated!"
      redirect_to survey_path(@question.survey)
    else
      flash[:alert] = "An error occurred while updating the question"
      render :edit  
    end  
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question Successfully destoryed"
  end

  private
    def question_params
      params.require(:question).permit(:body)
    end  

end  