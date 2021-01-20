class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]
  before_action :current_user
  before_action :authenticate_user, only: [:show]


  # GET /labels
  # GET /labels.json
  def index
    @label = Label.where(user_id: current_user.id )
  end

  # GET /labels/1
  # GET /labels/1.json
  def show
    @tasks = @label.tasks
  end

  # GET /labels/new
  def new
    @label = Label.new
  end

  # GET /labels/1/edit
  def edit
    if current_user.id != @label.user_id
    flash[:notice] = "Not Allowed!"
    redirect_to tasks_path(session[:task_user])
    return
  end
  end

  # POST /labels
  # POST /labels.json
  def create
    @label = Label.new(label_params)
    @label.user_id = current_user.id

    respond_to do |format|
      if @label.save
        format.html { redirect_to @label, notice: 'Label was successfully created.' }
        format.json { render :show, status: :created, location: @label }
      else
        format.html { render :new }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labels/1
  # PATCH/PUT /labels/1.json
  def update
    respond_to do |format|
      if @label.update(label_params)
        format.html { redirect_to @label, notice: 'Label was successfully updated.' }
        format.json { render :show, status: :ok, location: @label }
      else
        format.html { render :edit }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labels/1
  # DELETE /labels/1.json
  def destroy
    @label.destroy
    respond_to do |format|
      format.html { redirect_to labels_url, notice: 'Label was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = current_user.labels.find(params[:id])
    end

    def authenticate_user
      if @current_user == nil
        flash[:notice] = t('notice.login_needed')
        redirect_to new_session_path
      end
    end

    def admin_user
      current_user.try(:id) == 1
    end

    # Only allow a list of trusted parameters through.
    def label_params
      params.require(:label).permit(:name, :id)
    end
  end
