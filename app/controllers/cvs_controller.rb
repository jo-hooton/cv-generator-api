class CvsController < ApplicationController

    def index
        @cvs = CV.all
        render json: @cvs
      end

    def create
        user = get_current_user
       @cv = Cv.create(user_id: user.id, name: params[:title]) 
        render json: @cv
 
    end    

    end