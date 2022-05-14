class ListeningOptionsController < ApplicationController
    before_action :set_listening


     # Create Listening Option
    def create
        @listening_option = @listening.listening_options.create(listening_option_params)

        if @listening_option.save
            flash[:notice] = "Option has been created"
            redirect_to listening_path(@listening)
        else
            flash[:notice] = "Option has not been created"
            redirect_to listening_path(@listening)
        end
    end


    # Destroy listening Option
    def destroy
        @listening_option = @listening.listening_options.find(params[:id])
        @listening_option.destroy
        redirect_to listening_path(@listening)
    end



    private 



    def set_listening
        @listening = Listening.find(params[:listening_id])
    end


    def listening_option_params
        params.require(:listening_option).permit(:index, :question, :a, :b, :c, :answer)
    end
end
