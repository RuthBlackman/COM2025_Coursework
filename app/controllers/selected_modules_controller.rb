class SelectedModulesController < ApplicationController
  before_action :set_selected_module, only: %i[ show edit update destroy ]

  # GET /selected_modules or /selected_modules.json
  def index
    @selected_modules = SelectedModule.all
  end

  # GET /selected_modules/1 or /selected_modules/1.json
  def show
  end

  # GET /selected_modules/new
  def new
    @selected_module = SelectedModule.new
  end

  # GET /selected_modules/1/edit
  def edit
  end

  # POST /selected_modules or /selected_modules.json
  def create
    @selected_module = SelectedModule.new(selected_module_params)

    respond_to do |format|
      if @selected_module.save
        format.html { redirect_to @selected_module, notice: "Selected module was successfully created." }
        format.json { render :show, status: :created, location: @selected_module }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @selected_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selected_modules/1 or /selected_modules/1.json
  def update
    respond_to do |format|
      if @selected_module.update(selected_module_params)
        format.html { redirect_to @selected_module, notice: "Selected module was successfully updated." }
        format.json { render :show, status: :ok, location: @selected_module }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @selected_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selected_modules/1 or /selected_modules/1.json
  def destroy
    @selected_module.destroy
    respond_to do |format|
      format.html { redirect_to selected_modules_url, notice: "Selected module was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selected_module
      @selected_module = SelectedModule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def selected_module_params
      params.require(:selected_module).permit(:StudentID, :CourseModuleID)
    end
end
