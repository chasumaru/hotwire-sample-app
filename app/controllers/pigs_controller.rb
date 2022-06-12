class PigsController < ApplicationController
  before_action :set_pig, only: %i[ show edit update destroy ]

  # GET /pigs
  def index
    @pigs = Pig.all
  end

  # GET /pigs/1
  def show
  end

  # GET /pigs/new
  def new
    @pig = Pig.new
  end

  # GET /pigs/1/edit
  def edit
  end

  # POST /pigs
  def create
    @pig = Pig.new(pig_params)

    if @pig.save
      redirect_to @pig, notice: "Pig was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pigs/1
  def update
    if @pig.update(pig_params)
      redirect_to @pig, notice: "Pig was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pigs/1
  def destroy
    @pig.destroy
    redirect_to pigs_url, notice: "Pig was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pig
      @pig = Pig.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pig_params
      params.require(:pig).permit(:name, :age)
    end
end
