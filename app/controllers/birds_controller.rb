class BirdsController < ApplicationController
  before_action :set_bird, only: %i[ show edit update destroy ]

  # GET /birds
  def index
   # `Bird.ransack`でBirdに対してransackを使う
   # params[:q]には検索フォームで指定した検索条件が入る
   @search = Bird.ransack(params[:q])

   # デフォルトのソートをid降順にする
   @search.sorts = 'id desc' if @search.sorts.empty?

   # `@search.result`で検索結果となる@birdsを取得する
   # 検索結果に対してはkaminariのpageメソッドをチェーンできる
   @birds = @search.result.page(params[:page])
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
      flash.now.notice = "トリを登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /birds/1
  def update
    if @bird.update(bird_params)
      flash.now.notice = "トリを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /birds/1
  def destroy
    @bird.destroy
    flash.now.notice = "トリを削除しました。"
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
