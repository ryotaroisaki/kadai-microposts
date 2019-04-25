class FavoritesController < ApplicationController
   before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = '投稿をいいねしました'
    redirect_to :back
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'いいねを取り消しました'
    redirect_to :back
  end
end
