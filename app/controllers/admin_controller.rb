class AdminController < ApplicationController

  
    def index
    end

    def writings
        # Set all the writings
        @writings = Writing.all.includes(:user)
    end

    def questions
        # Set all the questions with comments included
        @questions = Question.all.includes(:user)
    end

    def readings
        @readings = Reading.all
    end

    def prompts
        @prompts = Prompt.all
    end

    def listenings
        @listenings = Listening.all
    end

    def comments
    end

    def users
    end

    def show_writing
        # Set Writing using Id in params
        @writing = Writing.includes(:user).find(params[:id])
    end

    def show_question
        # Set question using Id in params
        @question = Question.includes(comments: [:user, :rich_text_body]).find(params[:id])
    end

    def show_reading
        @reading = Reading.includes(:reading_problems).find(params[:id])
    end

    def show_prompt
        @prompt = Prompt.find(params[:id])
    end

    def show_listening
        @listening = Listening.includes(:listening_options).find(params[:id])
    end
end
