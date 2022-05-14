class CorrectionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_writing


    # Create a new correction
    def create
        # Create new correction
        @correction = @writing.corrections.create(correction_params)
        # Add current User to the correction
        @correction.user = current_user

        # If correction is saved - flash notice and redirect back to Writings path
        if @correction.save
            flash[:notice] = "Correction has been created"
            redirect_to writing_path(@writing)
        else
            flash[:notice] = "Correction has not been created"
            redirect_to writing_path(@writing)
        end
    end




     # Destroy a correction
    def destroy
        # Find the correction using the id in params
        @correction = @writing.corrections.find(params[:id])
        # Destroy the correction
        @correction.destroy
        # Redirect back to writing
        redirect_to writing_path(@writing)
    end





    private 


    # Set the Writing
    def set_writing
         # Find the Writing using the ID in params
        @writing = Writing.find(params[:writing_id])
    end


     # Params Allowed For Corrections
    def correction_params
        params.require(:correction).permit(:body)
    end
end
