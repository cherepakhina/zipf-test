class TextsForZipfsController < ApplicationController
  before_action :set_texts_for_zipf, only: %i[ show edit update destroy ]

  # GET /texts_for_zipfs or /texts_for_zipfs.json
  def index
    @texts_for_zipfs = TextsForZipf.all
  end

  # GET /texts_for_zipfs/1 or /texts_for_zipfs/1.json
  def show
  end

  # GET /texts_for_zipfs/new
  def new
    @texts_for_zipf = TextsForZipf.new
  end

  # GET /texts_for_zipfs/1/edit
  def edit
  end

  # POST /texts_for_zipfs or /texts_for_zipfs.json
  def create
    @texts_for_zipf = TextsForZipf.new(texts_for_zipf_params)

    respond_to do |format|
      if @texts_for_zipf.save
        format.html { redirect_to texts_for_zipf_url(@texts_for_zipf), notice: "Texts for zipf was successfully created." }
        format.json { render :show, status: :created, location: @texts_for_zipf }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @texts_for_zipf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /texts_for_zipfs/1 or /texts_for_zipfs/1.json
  def update
    respond_to do |format|
      if @texts_for_zipf.update(texts_for_zipf_params)
        format.html { redirect_to texts_for_zipf_url(@texts_for_zipf), notice: "Texts for zipf was successfully updated." }
        format.json { render :show, status: :ok, location: @texts_for_zipf }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @texts_for_zipf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texts_for_zipfs/1 or /texts_for_zipfs/1.json
  def destroy
    @texts_for_zipf.destroy

    respond_to do |format|
      format.html { redirect_to texts_for_zipfs_url, notice: "Texts for zipf was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_texts_for_zipf
      @texts_for_zipf = TextsForZipf.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def texts_for_zipf_params
      params.require(:texts_for_zipf).permit(:text_name, :text_file)
    end
end
