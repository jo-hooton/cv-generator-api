class CvsController < ApplicationController

    def index
        @cvs = CV.all
        render json: @cvs
      end

    def create
        user = get_current_user
       @cv = Cv.create(user_id: user.id, name: params[:title]) 
       @bio = TextItem.create(cv_id: @cv.id, title: "Bio", content: params[:bio])
        # user.update(photo: params[:photo]) 

        if params[:experience].length > 0
            @experience = List.create(title: "Experience", cv_id: @cv.id)
            params[:experience].each do |experience| 
            ListItem.create(name: experience[:position], sub_heading: experience[:company], content: experience[:dates], list_id: @experience.id)
            end
        end
        

        if params[:education].length > 0
            @education = List.create(title: "Education", cv_id: @cv.id)
            params[:education].each do |education| 
            ListItem.create(name: education[:qualification], sub_heading: education[:institution], content: education[:dates], list_id: @education.id)
            end
        end

        if params[:skills].length > 0
            params[:skills].each do |skill| 
            Skill.create(name: skill[:skill], percentage: skill[:skillfulness], cv_id: @cv.id)
            end
        end
      
        render json: @cv

   
    end
end