class ProgramQuotasController < ApplicationController
  before_action :set_program_quota, only: [:show, :edit, :update, :destroy]

  # GET /program_quotas
  # GET /program_quotas.json
  def index
    @program_quotas = ProgramQuota.all
  end

  # GET /program_quotas/1
  # GET /program_quotas/1.json
  def show
  end

  # GET /program_quotas/new
  def new
    @program_quota = ProgramQuota.new
  end

  # GET /program_quotas/1/edit
  def edit
  end

  # POST /program_quotas
  # POST /program_quotas.json
  def create
    @program_quota = ProgramQuota.new(program_quota_params)

    respond_to do |format|
      if @program_quota.save
        format.html { redirect_to program_quotas_path, notice: 'Program quota was successfully created.' }
        format.json { render :show, status: :created, location: @program_quota }
      else
        format.html { render :new }
        format.json { render json: @program_quota.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_quotas/1
  # PATCH/PUT /program_quotas/1.json
  def update
    respond_to do |format|
      if @program_quota.update(program_quota_params)
        format.html { redirect_to program_quotas_path, notice: 'Program quota was successfully updated.' }
        format.json { render :show, status: :ok, location: @program_quota }
      else
        format.html { render :edit }
        format.json { render json: @program_quota.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_quotas/1
  # DELETE /program_quotas/1.json
  def destroy
    @program_quota.destroy
    respond_to do |format|
      format.html { redirect_to program_quotas_url, notice: 'Program quota was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_quota
      @program_quota = ProgramQuota.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_quota_params
      params.require(:program_quota).permit(:academic_year_id, :program_id, :university_id, :quota)
    end
end
