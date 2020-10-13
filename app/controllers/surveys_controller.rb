class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
    render :index
  end

  def new
    @survey = Survey.new
    render :new
  end

  def create
   @survey = Survey.new(survey_params)
   if @survey.save
    flash[:notice] = "Survey reated Successfully!"
    redirect_to surveys_path
   else
    flash[:alert = "An error occurred while creating the survey."]
    render :new
   end  
  end

  def edit
    @survey = Survey.find(params[:id])
    render :edit
  end

  def show
   @survey = Survey.find(params[:id])
   rended :show
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update(survey_params)
      flash[:notice] = "Survey Updated Successfully!"
      redirect_to surveys_path
      render: edit
    else
      flash[:alert] = "There was an error processing your request."
    end    
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "YOU DESTROYED THAT SURVEY"
    redirect_to surveys_path
  end


  private
    def survey_params
      param.require(:survey).permit(:topic)
    end  
end