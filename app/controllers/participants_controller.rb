class ParticipantsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  # GET /participants
  # GET /participants.json
  def index
    @participants = @current_event.participants rescue nil || []
  end

  def import_participants
    if request.post?
      @participants = Participant.import_participants(params[:participants_csv_file])
      flash[:notice] = @participants.blank? ? 'No Participant imported' : 'Participants imported. Check the imported list below'
      render 'index'
    end
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
    participant_ids = params[:participants].delete_if{|e| e=='0'} rescue nil
    @participants = participant_ids.blank? ? @current_event.try(:participants) || [] : Participant.find(participant_ids)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "participants_badges",
               disposition: 'attachment',
               encoding: 'utf8'
        end
      end
  end

  # GET /participants/new
  def new
    @participant = Participant.new
    @participant.event = Event.current
  end

  # GET /participants/1/edit
  def edit
    if @participant.organization_type.try(:name) == 'FMOH'
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
        format.html { redirect_to participants_path, notice: 'Participant was successfully created.' }
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
    if @participant.organization_type.try(:name) == 'FMOH'
      @directorates = Directorate.all
    end
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to participants_path, notice: 'Participant was successfully updated.' }
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
      params.require(:participant).permit(:event_id, :event_id, :name, :responsibility, :place_of_work, :participant_type_id, :organization_name,
                                          :group_id, :field_visit_id, :telephone_number,:email, :stay_at, :organization_type_id, :photo)
    end
end
