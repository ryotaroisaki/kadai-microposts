class ToppagesController < ApplicationController
  def index
    
    if logged_in?
      @micropost = current_user.microposts.build  # form_for 用
      @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
    end
  end


  def likes
    @micropost = Micropost.find(params[:id])
    @likes = @micropost.likes.page(params[:page])
    count(@micropost)
  end    
end  