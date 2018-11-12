class CVController < ApplicationController

    def index
       
        @cvs = CV.all
        render json: @cvs
      end
    

    end