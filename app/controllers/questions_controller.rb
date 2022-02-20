class QuestionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_question!, only: [:show, :edit, :update, :destroy]

    def show
       @answer = @question.answers.build
       @answers = @question.answers.order created_at: :desc
    
    end

    def index
        @questions = Question.all
        
    end

    def new
        @question = Question.new
    end

    def create
       @question = Question.new(question_params)
       @question.user = current_user
       if @question.save
            flash[:notice] = "Question was created successfully."
            redirect_to @question
       else
            render 'new'
       end
    end

    def edit   

    end

    def update   
        if @question.update(question_params)
            flash[:notice] = "Question was updated successfully."
            redirect_to @question
        else
            render 'edit'
        end
    end

    def destroy     
        @question.destroy
        redirect_to questions_path, status: :see_other
    end

    private

    def set_question!
        @question = Question.find(params[:id])
    end

    def question_params
        params.require(:question).permit(:title, :body)
    end

end
