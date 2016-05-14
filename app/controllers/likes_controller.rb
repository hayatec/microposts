class LikesController < ApplicationController
     before_action :logged_in_user
     
    def create
        #binding.pry
        micropost_id= params[:micropost_id]
        @micropost = Micropost.find(micropost_id)
        current_user.like(@micropost)
        if @micropost.save
            flash[:success] = "Liked"
            redirect_to request.referrer || root_url
        else
            @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page(params[:page])
            render 'static_pages/home'
        end

    end
     
    def destroy
        #binding.pry
        @like = current_user.likes_relationships.find(params[:id])
        return redirect_to root_url if @like.nil?
        @like.destroy
        flash[:success] = "Unliked"
        redirect_to request.referrer || root_url
    end
 
end
