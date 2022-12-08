class DistributionDataLovecrsController < ApplicationController
  before_action :set_distribution_data_lovecr, only: %i[ show edit update destroy ]

  # GET /distribution_data_lovecrs or /distribution_data_lovecrs.json
  def index
    @dataLovecr = []
    filenameD = Rails.root.join('app', 'controllers', 'dat', 'distribLovecr.csv')
    if File.empty?(filenameD)
      # analysis of lovecraft's works
      fname = Rails.root.join('app', 'assets', 'textfiles', 'lovecraft_works.txt')
              
      full_text = File.read(fname)
      # regexp for getting all words
      words = full_text.scan(/\b\w+\b/)

      # calculating frequency of all words
      frequency = Hash.new(0)
      words.each { |word| frequency[word.downcase] += 1 }

      # sorting frequency hash in descending order
      mostFrequent = frequency.sort_by{|k, v| [-v, k]}
      # get top word frequency
      topCount = frequency.values.max
      divRound = []
      distribFull = []
      # print result with division !
      mostFrequent.each do |key, value| 
          division = topCount / value.to_f
          divRound << division.round(2)
          wordsN, frequencies = mostFrequent.map{ |k,v| [k.to_s, v.to_i] }.transpose
          distribFull = [wordsN, frequencies, divRound]
      end
      require 'csv'
      CSV.open(filenameD, "w") do |csv|
        distribFull.each{ |element| csv << element }
        # f.puts(distribFull)
      end
      redirect_back(fallback_location: distribution_data_lovecrs_path)
    else
      # csvData = CSV.read(filenameD)
      CSV.foreach(filenameD) do |row|
        @dataLovecr += row
      end
      # @data = csvData.scan(/\b\w+\b/)
    end
    
    @distribution_data_lovecr = DistributionDataLovecr.all
  end

  # GET /distribution_data_lovecrs/1 or /distribution_data_lovecrs/1.json
  def show
  end

  # GET /distribution_data_lovecrs/new
  def new
    @distribution_data_lovecr = DistributionDataLovecr.new
  end

  # GET /distribution_data_lovecrs/1/edit
  def edit
  end

  # POST /distribution_data_lovecrs or /distribution_data_lovecrs.json
  def create
    @distribution_data_lovecr = DistributionDataLovecr.new(distribution_data_lovecr_params)

    respond_to do |format|
      if @distribution_data_lovecr.save
        format.html { redirect_to distribution_data_lovecr_url(@distribution_data_lovecr), notice: "Distribution data lovecr was successfully created." }
        format.json { render :show, status: :created, location: @distribution_data_lovecr }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @distribution_data_lovecr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /distribution_data_lovecrs/1 or /distribution_data_lovecrs/1.json
  def update
    respond_to do |format|
      if @distribution_data_lovecr.update(distribution_data_lovecr_params)
        format.html { redirect_to distribution_data_lovecr_url(@distribution_data_lovecr), notice: "Distribution data lovecr was successfully updated." }
        format.json { render :show, status: :ok, location: @distribution_data_lovecr }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @distribution_data_lovecr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distribution_data_lovecrs/1 or /distribution_data_lovecrs/1.json
  def destroy
    @distribution_data_lovecr.destroy

    respond_to do |format|
      format.html { redirect_to distribution_data_lovecrs_url, notice: "Distribution data lovecr was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_distribution_data_lovecr
      @distribution_data_lovecr = DistributionDataLovecr.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def distribution_data_lovecr_params
      params.require(:distribution_data_lovecr).permit(:words, :frequency, :ratio)
    end
end
