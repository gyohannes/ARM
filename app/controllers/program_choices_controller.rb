class ProgramChoicesController < ApplicationController
  before_action :authenticate_user!
  authorize_resource
  before_action :set_program_choice, only: [:show, :edit, :update, :destroy]
  # GET /program_choices
  # GET /program_choices.json
  def index
    @program_choices = ProgramChoice.all
  end

  # GET /program_choices/1
  # GET /program_choices/1.json
  def show
  end

  # GET /program_choices/new
  def new
    @applicant = current_user.applicant
    @program_choices = @applicant.program_choices
    pr_count  = @program_choices.count
    if pr_count < 3
      ((pr_count + 1)..3).each do |order|
        @program_choices << ProgramChoice.create(applicant_id: @applicant.id, choice_order: order)
      end
    end
  end

  # GET /program_choices/1/edit
  def edit
  end

  # POST /program_choices
  # POST /program_choices.json
  def create
      @applicant = Applicant.find(params[:applicant])
      pc_params = params["program_choices"]
      pc_params.each do |program_choice|
          pc = ProgramChoice.find(pc_params[program_choice]["id"])
          pc.update(program_choice_params(pc_params[program_choice]))
      end

      unless @applicant.complete_program_choices.blank?
        flash[:notice] = 'Program choices successfuly saved'
        redirect_to new_university_choice_path
      else
        @program_choices = @applicant.program_choices
        flash[:alert] = 'Please select at least one program to proceed'
        render 'new'
      end
  end

  # PATCH/PUT /program_choices/1
  # PATCH/PUT /program_choices/1.json
  def update
    @applicant = Applicant.find(params[:applicant])
    if params.has_key?("program_choice")
      ProgramChoice.new(program_choice_params(params["program_choice"]))
    else
      params["program_choices"].each do |program_choice|
        if !program_choice["program_id"].blank?
          ProgramChoice.create(program_choice_params(program_choice))
        end
      end
    end
    unless @applicant.program_choices.blank?
      redirect_to new_university_choice_path(applicant: @applicant.id )
    else
      @program_choices = @applicant.program_choices
      pr_count  = @program_choices.count
      if pr_count < 3
        ((pr_count + 1)..3).each do |order|
          @program_choices << ProgramChoice.new(applicant_id: @applicant.id, choice_order: order)
        end
      end
      render 'edit'
    end
  end

  # DELETE /program_choices/1
  # DELETE /program_choices/1.json
  def destroy
    @program_choice.destroy
    respond_to do |format|
      format.html { redirect_to program_choices_url, notice: 'Program choice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_choice
      @program_choice = ProgramChoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_choice_params(my_params)
      my_params.permit(:id,:applicant_id, :choice_order, :program_id)
    end
end
