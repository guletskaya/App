class UsersController < ApplicationController
   
    before_action :set_user, only: [:show, :edit, :update]

    def new
      @user = User.new  
    end

    def show
        
      @questions = @user.questions
    end

    def index
        @users = User.all
    end

    def create
        
    end

    def edit
        
    end

    def update
        @user.avatar.attach(params[:avatar])
        if @user.update(user_params)
            
            flash[:notice] = "#{@user.username}, you have successfully updated your profile!"
            sign_in :user, @user, bypass: true
            redirect_to @user
        else
            render 'edit'
        end
    end
    

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :avatar)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
