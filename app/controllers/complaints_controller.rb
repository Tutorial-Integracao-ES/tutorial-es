class ComplaintsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]
  helper_method :authorized_user?, :allowed_companies

  # GET /complaints
  # GET /complaints.json
  def index
    @complaints = Complaint.all
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
  end

  # GET /complaints/new
  def new
    @complaint = Complaint.new
  end

  # GET /complaints/1/edit
  def edit
    redirect_to complaints_path unless authorized_user?
    return 
  end

  # POST /complaints
  # POST /complaints.json
  def create
    @complaint = Complaint.new(
      "title" => complaint_params[:title],
      "content" => complaint_params[:content],
      "category" => complaint_params[:category],
      "company" => complaint_params[:company],
      "user_id" => session[:user_id]
    )

    respond_to do |format|
      if @complaint.save
        format.html { redirect_to @complaint, notice: 'Complaint was successfully created.' }
        format.json { render :show, status: :created, location: @complaint }
      else
        format.html { render :new }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complaints/1
  # PATCH/PUT /complaints/1.json
  def update
    return unless authorized_user?

    respond_to do |format|
      if @complaint.update(complaint_params)
        format.html { redirect_to @complaint, notice: 'Complaint was successfully updated.' }
        format.json { render :show, status: :ok, location: @complaint }
      else
        format.html { render :edit }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    return unless authorized_user?
     
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url, notice: 'Complaint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def complaint_params
      params.require(:complaint).permit(:title, :content, :category, :company, :user_id)
    end

    def authorized_user?
      session[:user_id] == @complaint.user_id
    end
  
    def allowed_companies 
      ['Empresa1', 'Empresa2', 'Empresa3']
    end
end
