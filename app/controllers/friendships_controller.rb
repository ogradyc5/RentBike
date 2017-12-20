class FriendshipsController < ApplicationController
    def destroy
        #@friendship.create_activity :destroy, owner: current_user
        @friendship = current_user.friendships.where(friend_id: params[:id]).first
        @friendship.destroy
        flash[:notice] = "Friend was successfully removed"
        redirect_to my_friends_path
    end
end
