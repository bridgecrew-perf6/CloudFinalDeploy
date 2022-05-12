class ListeningsController < ApplicationController
  before_action :set_listening, only: %i[ show edit update destroy ]

  # GET /listenings or /listenings.json
  def index
    @listenings = Listening.all
  end

  # GET /listenings/1 or /listenings/1.json
  def show
  end

  # GET /listenings/new
  def new
    @listening = Listening.new
  end

  # GET /listenings/1/edit
  def edit
  end

  # POST /listenings or /listenings.json
  def create
    @listening = Listening.new(listening_params)

    respond_to do |format|
      if @listening.save
        format.html { redirect_to listening_url(@listening), notice: "Listening was successfully created." }
        format.json { render :show, status: :created, location: @listening }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listenings/1 or /listenings/1.json
  def update
    respond_to do |format|
      if @listening.update(listening_params)
        format.html { redirect_to listening_url(@listening), notice: "Listening was successfully updated." }
        format.json { render :show, status: :ok, location: @listening }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listenings/1 or /listenings/1.json
  def destroy
    @listening.destroy

    respond_to do |format|
      format.html { redirect_to listenings_url, notice: "Listening was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listening
      @listening = Listening.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listening_params
      params.require(:listening).permit(:title, :level, :song_file)
    end
end
