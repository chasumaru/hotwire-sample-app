class DeersController < ApplicationController
  before_action :set_deer, only: %i[ show edit update destroy ]

  # GET /deers
  def index
    @deers = Deer.all
  end

  # GET /deers/1
  def show
  end

  # GET /deers/new
  def new
    @deer = Deer.new
  end

  # GET /deers/1/edit
  def edit
  end

  # POST /deers
  def create
    @deer = Deer.new(deer_params)

    if @deer.save
      redirect_to @deer, notice: "Deer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deers/1
  def update
    if @deer.update(deer_params)
      redirect_to @deer, notice: "Deer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /deers/1
  def destroy
    @deer.destroy
    redirect_to deers_url, notice: "Deer was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deer
      @deer = Deer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deer_params
      params.require(:deer).permit(:name, :age)
    end
end
