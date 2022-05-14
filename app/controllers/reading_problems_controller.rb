class ReadingProblemsController < ApplicationController
    before_action :set_reading

    # Create Reading Problem
    def create
        @reading_problem = @reading.reading_problems.create(reading_problem_params)

        if @reading_problem.save
            flash[:notice] = "Problem has been created"
            redirect_to reading_path(@reading)
        else
            flash[:notice] = "Problem has not been created"
            redirect_to reading_path(@reading)
        end
    end


    # Destroy Reading Problem
    def destroy
        @reading_problem = @reading.reading_problems.find(params[:id])
        @reading_problem.destroy
        redirect_to reading_path(@reading)
    end




    private

    def set_reading
        @reading = Reading.find(params[:reading_id])
    end


    def reading_problem_params
        params.require(:reading_problem).permit(:index, :question, :answer)
    end
end
