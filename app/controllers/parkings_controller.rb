class ParkingsController < ApplicationController
  #ログインしているかどうかをチェック
  before_action :authenticate_user!
  #ログインしているユーザーの駐車場情報を開こうとしているかどうかをチェック
  before_action :authenticate_users_parking!, only: [:show, :edit, :update, :destroy]

  before_action :set_user
  before_action :set_parking, only: [:show, :edit, :update, :destroy]

  def index
    @parkings = Parking.all.where(user_id: current_user.id).order("length(symbol)").order(:symbol)
  end

  def show
  end

  # GET /parkings/new
  def new
    @parking = Parking.new
  end

  # GET /parkings/1/edit
  def edit
  end

  # POST /parkings
  # POST /parkings.json
  def create
    @parking = Parking.new(parking_params)

    @parking.user_id = current_user.id

    # respond_to do |format|
      if @parking.save
        redirect_to new_parking_path, notice: '駐車場情報の作成に成功しました。'
        # format.html { redirect_to @parking, notice: 'Parking was successfully created.' }
        # format.json { render :show, status: :created, location: @parking }
      else
        #エラー情報をフラッシュに保存
        flash[:danger] = @parking.errors.full_messages
        render :new
        # format.html { render :new }
        # format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /parkings/1
  # PATCH/PUT /parkings/1.json
  def update
    if @parking.update(parking_params)
      redirect_to edit_parking_path(@parking), notice: '駐車場情報の更新に成功しました。'
    else

      #エラー情報をフラッシュに保存
      flash[:danger] = @parking.errors.full_messages
      render :edit
    end
  end

  # DELETE /parkings/1
  # DELETE /parkings/1.json
  def destroy
    @parking.destroy
    redirect_to parkings_url, notice: 'Parking was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_user
      @user = current_user
    end
    def set_parking
      @parking = Parking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parking_params
      params.require(:parking).permit(:symbol, :name, :address, :lat, :lon, :price, :memo, :managing_memo, :number, :empty_number, :status)
    end


    def authenticate_users_parking!
      redirect_to err_path if not current_user.id == Parking.find(params[:id]).user_id
    end
end
