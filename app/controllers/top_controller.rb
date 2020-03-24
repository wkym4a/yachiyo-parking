class TopController < ApplicationController

  def form
    @user = User.find(1)
    #「空き有り」「空き予定」「空き無し」の全てを表示（「空き無し」は灰色のピンとする……js側で処理）
    @parkings = @user.parkings
    # #「空き有り」「空き予定」のみ表示（「空き無し」は表示しない）
    # @parkings = @user.parkings.where("status in (0,1)")
  end

end
