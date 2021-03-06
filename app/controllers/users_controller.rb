class UsersController < ApplicationController

  #ログインしているかどうかをチェック
  before_action :authenticate_user!, only: [:show, :edit, :update]
  #ログインしているユーザーの情報を開こうとしているかどうかをチェック
  before_action :authenticate_users_info!, only: [:show, :edit, :update]

  before_action :set_user, only: [:show, :edit, :update,:parking_info]
  def show
  end

  def edit
  end

  def update
    if @user.update(user_params_for_update)
      redirect_to edit_user_path(@user), notice: 'ユーザー情報を変更しました。'
      # redirect_to @user, notice: 'ユーザー情報を変更しました。'
    else
      #エラー情報をフラッシュに保存
      flash[:danger] = @user.errors.full_messages
      render :edit
    end
  end

  #対象業者の駐車場状況確認画面
  #……ログインしていなくても、誰でも見れる
  def parking_info

    #「空き有り」「空き予定」「空き無し」の全てを表示（「空き無し」は灰色のピンとする……js側で処理）
    @parkings = @user.parkings
    # #「空き有り」「空き予定」のみ表示（「空き無し」は表示しない）
    # @parkings = @user.parkings.where("status in (0,1)")
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params_for_update
    params_info = params.require(:user).permit(:name,  :address, :lat, :lon, :url , :tel , :fax ,:memo)
  end


  def authenticate_users_info!
    redirect_to err_path if not current_user.id == params[:id].to_i
  end

end
