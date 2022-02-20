class PagesController < ApplicationController
    def home
       redirect_to questions_path if user_signed_in? 
    end
    
end
