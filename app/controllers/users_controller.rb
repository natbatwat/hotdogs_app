class UsersController < ApplicationController
  def index
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update
  end

  def update_preferences
    preferences = params[:user]
    current_user.preference_list.add(preferences)
    binding.pry
    redirect_to user_path(current_user)
  end


  def questionnaire
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :dog_name, :owner_name, :dog_age, :dog_bio, :owner_bio, :gender, :breed, :neutered, :address, :interest, :user_rating, :dog_picture, :owner_picture, :match_list => [], :preference_list => [])
  end
end
