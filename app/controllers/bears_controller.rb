class BearsController < ApplicationController
  before_action :set_bear, only: %i[ show edit update destroy ]

  # GET /bears
  def index
    @bears = Bear.all
  end

  # GET /bears/1
  def show
  end

  # GET /bears/new
  def new
    @bear = Bear.new
  end

  # GET /bears/1/edit
  def edit
  end

  # POST /bears
  def create
    @bear = Bear.new(bear_params)

    if @bear.save
      redirect_to @bear, notice: "Bear was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bears/1
  def update
    if @bear.update(bear_params)
      redirect_to @bear, notice: "Bear was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bears/1
  def destroy
    @bear.destroy
    redirect_to bears_url, notice: "Bear was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bear
      @bear = Bear.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bear_params
      params.require(:bear).permit(:name, :age)
    end
end
