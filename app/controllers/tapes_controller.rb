class TapesController < ApplicationController
  before_action :set_tape, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user! 
  # GET /tapes
  # GET /tapes.json
  def index
    @tapes = Tape.where(user_id: current_user.id)
  end

  def share
    @tape = Tape.find(params[:id])
  end
  # GET /tapes/1
  # GET /tapes/1.json
  def show
    @song = Song.new 
  end

  # GET /tapes/new
  def new
    @tape = Tape.new
  end

  # GET /tapes/1/edit
  def edit
  end

  # POST /tapes
  # POST /tapes.json
  def create
    @tape = Tape.new(tape_params)

    respond_to do |format|
      if @tape.save
        format.html { redirect_to root_path, notice: 'Tape was created. Now add some tracks!' }
        format.json { render :show, status: :created, location: @tape }
      else
        format.html { render :new }
        format.json { render json: @tape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tapes/1
  # PATCH/PUT /tapes/1.json
  def update
    respond_to do |format|
      if @tape.update(tape_params)
        format.html { redirect_to @tape, notice: 'Tape was successfully remixed.' }
        format.json { render :show, status: :ok, location: @tape }
      else
        format.html { render :edit }
        format.json { render json: @tape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tapes/1
  # DELETE /tapes/1.json
  def destroy
    @tape.destroy
    respond_to do |format|
      format.html { redirect_to tapes_url, notice: 'Tape has been stomped on and thrown away.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tape
      @tape = Tape.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tape_params
      params.require(:tape).permit(:title, :friend, :note, :user_id)
    end
end
