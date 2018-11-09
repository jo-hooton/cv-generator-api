class UsersController < ApplicationController

    def sign_in
        user = User.find_by (email: params[:email])
        if user && user.authenticate(params[:password])
            render json: {email: user.email, token: issue_token({id: user.id})}
        else
            render json {error: 'Invalid email/password combination.'}, status 400
    end
end

    def Validate
    user = get_current_user
    if user
        render json: {email: user.email, token:issue_token ({id: user.id})
    else
        render json: {error: "User not found"}, status 400
        end
    end

    def get_CV
        user = get_current_user
        if user 
            render json: user.CV
        else
            render json: {error: "you are not signed in."}
        end
    end
end


