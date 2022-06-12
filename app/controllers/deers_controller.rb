class DeersController < ApplicationController
  before_action :set_deer, only: %i[ show edit update destroy ]

  # GET /deers or /deers.json
  def index
   # `Cat.ransack`でCatに対してransackを使う
   # params[:q]には検索フォームで指定した検索条件が入る
   @search = Deer.ransack(params[:q])

   # デフォルトのソートをid降順にする
   @search.sorts = 'id desc' if @search.sorts.empty?

   # `@search.result`で検索結果となる@ deersを取得する
   # 検索結果に対してはkaminariのpageメソッドをチェーンできる
   @deers = @search.result.page(params[:page])

  end

  # GET /deers/1 or /deers/1.json
  def show
  end

  # GET /deers/new
  def new
    @deer = Deer.new
  end

  # GET /deers/1/edit
  def edit
  end

  # POST /deers or /deers.json
  def create
    @deer = Deer.new(deer_params)

    respond_to do |format|
      if @deer.save
        format.html { redirect_to deer_url(@deer), notice: "シカを登録しました。" }
        format.json { render :show, status: :created, location: @deer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deers/1 or /deers/1.json
  def update
    respond_to do |format|
      if @deer.update(deer_params)
        format.html { redirect_to deer_url(@deer), notice: "シカが更新されました。" }
        format.json { render :show, status: :ok, location: @deer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deers/1 or /deers/1.json
  def destroy
    @deer.destroy

    respond_to do |format|
      format.html { redirect_to deers_url, notice: "シカを削除しました。" }
      format.json { head :no_content }
    end
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
