class UniversityChoicesController < ApplicationController
  before_action :set_university_choice, only: [:show, :edit, :update, :destroy]

  # GET /university_choices
  # GET /university_choices.json
  def index
    @university_choices = UniversityChoice.all
  end

  # GET /university_choices/1
  # GET /university_choices/1.json
  def show
  end

  # GET /university_choices/new
  def new
    @applicant = Applicant.find(params[:applicant])
    @applicant.complete_program_choices.each do |pc|
      uc_count = pc.university_choices.count
      ((uc_count + 1)..pc.program.universities.count).each do |order|
        UniversityChoice.create(choice_order: order, program_choice_id: pc.id)
      end
    end
  end

  # GET /university_choices/1/edit
  def edit
  end

  # POST /university_choices
  # POST /university_choices.json
  def create
    @applicant = Applicant.find(params[:applicant])
    uc_params = params["university_choices"]
    uc_params.each do |university_choice|
      uc = UniversityChoice.find(uc_params[university_choice]["id"])
      uc.update(university_choice_params(uc_params[university_choice]))
    end

    unless @applicant.complete_university_choices.blank?
      flash[:notice] = 'University choices saved successfully'
      if @applicant.applicant_exam_hub.blank?
        redirect_to new_applicant_exam_hub_path(applicant: @applicant.id)
      else
        redirect_to edit_applicant_exam_hub_path(@applicant.applicant_exam_hub)
      end
    else
      flash[:alert] = 'Please select at least one university to proceed'
      render 'new'
    end
  end

  # PATCH/PUT /university_choices/1
  # PATCH/PUT /university_choices/1.json
  def update

  end

  # DELETE /university_choices/1
  # DELETE /university_choices/1.json
  def destroy
    @university_choice.destroy
    respond_to do |format|
      format.html { redirect_to university_choices_url, notice: 'University choice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_university_choice
      @university_choice = UniversityChoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def university_choice_params(my_params)
      my_params.permit(:program_choice_id, :choice_order, :university_id)
    end
end
