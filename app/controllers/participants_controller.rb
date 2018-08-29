class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  # GET /participants
  # GET /participants.json
  def index
    @participants = @current_event.participants || []
  end

  def load_directorates
    organization_type = OrganizationType.find(params[:organization_type])
    @directorates = organization_type.name == 'FMOH' ? Directorate.all : []
    render partial: 'directorate'
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
  end

  def badges
    participant_ids = params[:participants].delete_if{|e| e=='0'}
    @participants = participant_ids.blank? ? @current_event.participants : Participant.find(participant_ids)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "participants_badges",
               disposition: 'attachment',
               encoding: 'utf8',
               disable_smart_shrinking:  false
        end
      end
  end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit
    if @participant.organization_type.name == 'FMOH'
      @directorates = Directorate.all
    end
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(participant_params)
    if @participant.organization_type and @participant.organization_type.name == 'FMOH'
      @directorates = Directorate.all
    end
    respond_to do |format|
      if @participant.save
        format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json
  def update
    if @participant.organization_type.name == 'FMOH'
      @directorates = Directorate.all
    end
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to participants_url, notice: 'Participant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_params
      params.require(:participant).permit(:event_id, :name, :title, :telephone_number, :email, :organization_name, :organization_type_id, :directorate_id, :responsibility, :place_of_work, :group_id, :field_visit, :stay_at, :participant_type_id, :checked_in)
    end
end