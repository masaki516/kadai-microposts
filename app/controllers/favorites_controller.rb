class FavoritesController < ApplicationController
  
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'この投稿をお気に入りに登録しました。'
    redirect_to root_path
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'この投稿のお気に入りを解除しました。'
    redirect_to root_path
  end
end
