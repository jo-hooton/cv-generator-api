class CvsController < ApplicationController

    def index
        @cvs = Cv.all
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

        if params[:contact].length > 0
            params[:contact].each do |contact_detail| 
            ContactDetail.create(address: contact_detail[:address], phone_number: contact_detail[:phoneNumber], cv_id: @cv.id)
            end
        end
      
        render json: @cv

   
    end

    def get_all_cvs
            cvs = []
            Cv.all.each do |cv| 
                lists = []
                cv.lists.each do |list|
                    lists << { name: list.title, id: list.id, cv_id: list.cv_id, list_items: list.list_items }
                end
                photo = ''
                email = ''
                User.all.each do |user|
                    if user.id === cv.user_id
                    photo = user.photo 
                    email = user.email
                    end
                end
                cvs << { title: cv.name, id: cv.id, text_items: cv.text_items, lists: lists, skills: cv.skills, contact_details: cv.contact_details, photo: photo, email: email }
            end
            render json: cvs

    end
end