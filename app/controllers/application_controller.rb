class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def authenticate_user
        if @current_user == nil
            flash[:notice] = "ログインしてください"
            redirect_to("/login")
        end
    end

    def forbid_login_user
        if @current_user
            flash[:notice] = "すでにログインしています"
            redirect_to("/")
        end
    end
    
    def forbid_guest_user
        if @current_user.id == 1
            flash[:notice] = "新規登録が必要です"
            redirect_to("/")
        end
    end
        
end
