class SelectedModulesController < ApplicationController
  before_action :set_selected_module, only: %i[ show edit update  ]
  before_action :authenticate_user!

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
    @selected_module.user = current_user

    # TODO: check if course_module is nil and return an error.
    @selected_module.course_module = CourseModule.find(params[:module_id])
    if @selected_module.course_module.nil?
      flash.alert = "Need course module id"
      redirect_to(my_modules_path, notice: "Need course module id")
      return
    end
  end

  # GET /selected_modules/1/edit
  def edit
  end

  # POST /selected_modules or /selected_modules.json
  def create
    @selected_module = SelectedModule.new(selected_module_params)

    #if the user already has 120 credits, then they should not be allowed to select another module
    if current_user.credits == 120
      respond_to do |format|
        format.html { redirect_to CourseModule, notice: "Cannot select another module - already have 120 credits." }
        format.json { render json: {
          message: "Cannot select another module - already have 120 credits."
        }, status: :created, location: @selected_module }
      end
      return
    end

    #if the year of the user does not match the year of the module, then they should not be allowed to select that module
    if current_user.year != @selected_module.course_module.Year
      respond_to do |format|
        format.html { redirect_to CourseModule, notice: "Cannot select this module - not in the correct year." }
        format.json { render json: {
          message: "Cannot select this module - not in the correct year."
        }, status: :created, location: @selected_module }
      end
      return
    end

    #if they don't already have 120 credits and they are in the right year, then continue with selecting the module
    respond_to do |format|
      if @selected_module.save
        format.html { redirect_to @selected_module, notice: "Selected module was successfully created." }
        format.json { render :show, status: :created, location: @selected_module }

        #add the module credits to the user's credits
        current_user.credits += @selected_module.course_module.Credits
        current_user.save
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

    @selected_module = SelectedModule.where(["course_module_id = ? AND user_id = ?", params[:id], current_user.id ]).first!

    @selected_module.destroy
    respond_to do |format|
      format.html { redirect_to my_modules_path, notice: "Selected module was successfully destroyed." }
      format.json { head :no_content }

      #subtract the module credits from the user's credits
      current_user.credits -= @selected_module.course_module.Credits
      current_user.save
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selected_module
      @selected_module = SelectedModule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def selected_module_params
      params.require(:selected_module).permit(:id, :user_id, :course_module_id)
    end
end
