class FieldVisitsController < ApplicationController
  before_action :set_field_visit, only: [:show, :edit, :update, :destroy]

  # GET /field_visits
  # GET /field_visits.json
  def index
    @field_visits = FieldVisit.all
  end

  # GET /field_visits/1
  # GET /field_visits/1.json
  def show
  end

  # GET /field_visits/new
  def new
    @field_visit = FieldVisit.new
  end

  # GET /field_visits/1/edit
  def edit
  end

  # POST /field_visits
  # POST /field_visits.json
  def create
    @field_visit = FieldVisit.new(field_visit_params)

    respond_to do |format|
      if @field_visit.save
        format.html { redirect_to field_visits_path, notice: 'Field visit was successfully created.' }
        format.json { render :show, status: :created, location: @field_visit }
      else
        format.html { render :new }
        format.json { render json: @field_visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_visits/1
  # PATCH/PUT /field_visits/1.json
  def update
    respond_to do |format|
      if @field_visit.update(field_visit_params)
        format.html { redirect_to field_visits_path, notice: 'Field visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @field_visit }
      else
        format.html { render :edit }
        format.json { render json: @field_visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_visits/1
  # DELETE /field_visits/1.json
  def destroy
    @field_visit.destroy
    respond_to do |format|
      format.html { redirect_to field_visits_url, notice: 'Field visit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_visit
      @field_visit = FieldVisit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_visit_params
      params.require(:field_visit).permit(:name)
    end
end
