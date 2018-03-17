class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # GET /attachments
  # GET /attachments.json
  def index
    @attachments = Attachment.all
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
  end

  # GET /attachments/new
  def new
    @attachment = Attachment.new
    @applicant = Applicant.find(params[:applicant])
  end

  # GET /attachments/1/edit
  def edit
    @applicant = @attachment.applicant
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(attachment_params)
    @applicant = Applicant.find(params[:applicant])
    respond_to do |format|
      if @attachment.save
        format.html { redirect_to new_applicant_exam_hub_path(applicant: @applicant.id), notice: 'Attachment was successfully created.' }
        format.json { render :show, status: :created, location: @attachment }
      else
        format.html { render :new }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    @applicant = @attachment.applicant
    respond_to do |format|
      if @attachment.update(attachment_params)
        if @applicant.applicant_exam_hub.blank?
          format.html { redirect_to new_applicant_exam_hub_path(applicant: @applicant.id), notice: 'Attachment was successfully updated.' }
        else
          format.html { redirect_to edit_applicant_exam_hub_path(@applicant.applicant_exam_hub), notice: 'Attachment was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to attachments_url, notice: 'Attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_params
      params.require(:attachment).permit(:applicant_id, :photo, :cv, :motivation_letter, :sponsorship_letter)
    end
end
