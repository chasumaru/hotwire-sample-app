class PigsController < ApplicationController
  before_action :set_pig, only: %i[ show edit update destroy ]

  # GET /pigs
  def index
    # `pig.ransack`でpigに対してransackを使う
    # params[:q]には検索フォームで指定した検索条件が入る
    @search = Pig.ransack(params[:q])

    # デフォルトのソートをid降順にする
    @search.sorts = 'id desc' if @search.sorts.empty?

    # `@search.result`で検索結果となる@pigsを取得する
    # 検索結果に対してはkaminariのpageメソッドをチェーンできる
    @pigs = @search.result.page(params[:page])
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
      flash.now.notice = "いのししを登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pigs/1
  def update
    if @pig.update(pig_params)
      flash.now.notice = "いのししを更新しました。"

    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pigs/1
  def destroy
    @pig.destroy
    flash.now.notice = "いのししを削除しました。"
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
