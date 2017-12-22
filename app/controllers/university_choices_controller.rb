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
    @applicant.program_choices.each do |pc|
      (1..pc.program.universities.count).each do |order|
        pc.university_choices.build(choice_order: order)
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
    if params.has_key?("university_choice")
      UniversityChoice.create(university_choice_params(params["university_choice"]))
    else
      params["university_choices"].each do |university_choice|
        if !university_choice["university_id"].blank?
          UniversityChoice.create(university_choice_params(university_choice))
        end
      end
    end
    redirect_to details_applicant_path(@applicant)
    @applicant.update(status: true)
    flash[:notice] = 'Application submitted successfully' 
  end

  # PATCH/PUT /university_choices/1
  # PATCH/PUT /university_choices/1.json
  def update
    respond_to do |format|
      if @university_choice.update(university_choice_params)
        format.html { redirect_to @university_choice, notice: 'University choice was successfully updated.' }
        format.json { render :show, status: :ok, location: @university_choice }
      else
        format.html { render :edit }
        format.json { render json: @university_choice.errors, status: :unprocessable_entity }
      end
    end
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
