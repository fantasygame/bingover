class FrazesController < ApplicationController
  before_action :set_fraze, only: [:show, :edit, :update, :destroy]

  # GET /frazes
  # GET /frazes.json
  def index
    @frazes = Fraze.all
  end

  # GET /frazes/1
  # GET /frazes/1.json
  def show
  end

  # GET /frazes/new
  def new
    @fraze = Fraze.new
  end

  # GET /frazes/1/edit
  def edit
  end

  # POST /frazes
  # POST /frazes.json
  def create
    @fraze = Fraze.new(fraze_params)

    respond_to do |format|
      if @fraze.save
        format.html { redirect_to @fraze, notice: 'Fraze was successfully created.' }
        format.json { render :show, status: :created, location: @fraze }
      else
        format.html { render :new }
        format.json { render json: @fraze.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frazes/1
  # PATCH/PUT /frazes/1.json
  def update
    respond_to do |format|
      if @fraze.update(fraze_params)
        format.html { redirect_to @fraze, notice: 'Fraze was successfully updated.' }
        format.json { render :show, status: :ok, location: @fraze }
      else
        format.html { render :edit }
        format.json { render json: @fraze.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frazes/1
  # DELETE /frazes/1.json
  def destroy
    @fraze.destroy
    respond_to do |format|
      format.html { redirect_to frazes_url, notice: 'Fraze was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fraze
      @fraze = Fraze.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fraze_params
      params.require(:fraze).permit(:body)
    end
end