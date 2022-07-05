class BearsController < ApplicationController
  before_action :set_bear, only: %i[ show edit update destroy ]

  # GET /bears
  def index
   # `Bear.ransack`でBearに対してransackを使う
   # params[:q]には検索フォームで指定した検索条件が入る
   @search = Bear.ransack(params[:q])

   # デフォルトのソートをid降順にする
   @search.sorts = 'id desc' if @search.sorts.empty?

   # `@search.result`で検索結果となる@bearsを取得する
   # 検索結果に対してはkaminariのpageメソッドをチェーンできる
   @bears = @search.result.page(params[:page])
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
      flash.now.notice = "クマを登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bears/1
  def update
    if @bear.update(bear_params)
      flash.now.notice = "クマを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bears/1
  def destroy
    @bear.destroy
    flash.now.notice = "クマを削除しました。"
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
