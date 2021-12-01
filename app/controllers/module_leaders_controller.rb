class ModuleLeadersController < ApplicationController
  before_action :set_module_leader, only: %i[ show edit update destroy ]

  # GET /module_leaders or /module_leaders.json
  def index
    @module_leaders = ModuleLeader.all
  end

  # GET /module_leaders/1 or /module_leaders/1.json
  def show
  end

  # GET /module_leaders/new
  def new
    @module_leader = ModuleLeader.new
  end

  # GET /module_leaders/1/edit
  def edit
  end

  # POST /module_leaders or /module_leaders.json
  def create
    @module_leader = ModuleLeader.new(module_leader_params)

    respond_to do |format|
      if @module_leader.save
        format.html { redirect_to @module_leader, notice: "Module leader was successfully created." }
        format.json { render :show, status: :created, location: @module_leader }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @module_leader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /module_leaders/1 or /module_leaders/1.json
  def update
    respond_to do |format|
      if @module_leader.update(module_leader_params)
        format.html { redirect_to @module_leader, notice: "Module leader was successfully updated." }
        format.json { render :show, status: :ok, location: @module_leader }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @module_leader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /module_leaders/1 or /module_leaders/1.json
  def destroy
    @module_leader.destroy
    respond_to do |format|
      format.html { redirect_to module_leaders_url, notice: "Module leader was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_module_leader
      @module_leader = ModuleLeader.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def module_leader_params
      params.require(:module_leader).permit(:firstName, :lastName, :department, :office, :officeHours)
    end
end
