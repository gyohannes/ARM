class ParticipantTypesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_participant_type, only: [:show, :edit, :update, :destroy]

  # GET /participant_types
  # GET /participant_types.json
  def index
    @participant_types = ParticipantType.all
  end

  # GET /participant_types/1
  # GET /participant_types/1.json
  def show
  end

  # GET /participant_types/new
  def new
    @participant_type = ParticipantType.new
  end

  # GET /participant_types/1/edit
  def edit
  end

  # POST /participant_types
  # POST /participant_types.json
  def create
    @participant_type = ParticipantType.new(participant_type_params)

    respond_to do |format|
      if @participant_type.save
        format.html { redirect_to participant_types_path, notice: 'Participant type was successfully created.' }
        format.json { render :show, status: :created, location: @participant_type }
      else
        format.html { render :new }
        format.json { render json: @participant_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participant_types/1
  # PATCH/PUT /participant_types/1.json
  def update
    respond_to do |format|
      if @participant_type.update(participant_type_params)
        format.html { redirect_to participant_types_path, notice: 'Participant type was successfully updated.' }
        format.json { render :show, status: :ok, location: @participant_type }
      else
        format.html { render :edit }
        format.json { render json: @participant_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participant_types/1
  # DELETE /participant_types/1.json
  def destroy
    @participant_type.destroy
    respond_to do |format|
      format.html { redirect_to participant_types_url, notice: 'Participant type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant_type
      @participant_type = ParticipantType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_type_params
      params.require(:participant_type).permit(:name, :description, :badge_color)
    end
end
