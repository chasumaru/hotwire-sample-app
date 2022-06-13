class BirdsController < ApplicationController
  before_action :set_bird, only: %i[ show edit update destroy ]

  # GET /birds
  def index
    @birds = Bird.all
  end

  # GET /birds/1
  def show
  end

  # GET /birds/new
  def new
    @bird = Bird.new
  end

  # GET /birds/1/edit
  def edit
  end

  # POST /birds
  def create
    @bird = Bird.new(bird_params)

    if @bird.save
      redirect_to @bird, notice: "Bird was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /birds/1
  def update
    if @bird.update(bird_params)
      redirect_to @bird, notice: "Bird was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /birds/1
  def destroy
    @bird.destroy
    redirect_to birds_url, notice: "Bird was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bird
      @bird = Bird.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bird_params
      params.require(:bird).permit(:name, :age)
    end
end
