class ApplicationController < ActionController::API

    def issue_token(data)
        JWT.encode(data, secret)
    end

    def get_current_user
        id = decoded_token['id']
        User.find_by(id: id)

    def decode_token
        token = request.headers['Authorization']
        begin
            JWT.decode(token, secret)[0]
        rescue JWT::DecodeError
            {}
    end

    def secret
        # "tellnobody"
        ENV['API_SECRET']
        # create an environment varialble with secret. save on server or in gitignore file. 
    end
end
