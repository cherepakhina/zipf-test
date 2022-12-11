class DistributionDataCarmillasController < ApplicationController
  before_action :set_distribution_data_carmilla, only: %i[ show edit update destroy ]

  # GET /distribution_data_carmillas or /distribution_data_carmillas.json
  def index
    require 'csv'
    @dataCarmilla = []
    @dataCarmillaChart = Hash.new()
    filenameD = Rails.root.join('app', 'controllers', 'dat', 'distribCarmil.csv')

    if File.empty?(filenameD)
      # analysis of carmilla
      fname = Rails.root.join('app', 'assets', 'textfiles', 'carmilla_text.txt')
              
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
      redirect_back(fallback_location: distribution_data_carmillas_path)
    else
      # csvData = CSV.read(filenameD)
      CSV.foreach(filenameD) do |row|
        @dataCarmilla += row
      end
      ##
      # CSV.foreach(filenameD).with_index(1) do |row, rowno|
      #  @dataCarmillaChart << row
      #  break if rowno > 2
      ## end
      # @data = csvData.scan(/\b\w+\b/)
    end
    
    @distribution_data_carmillas = DistributionDataCarmilla.all
  end

  # GET /distribution_data_carmillas/1 or /distribution_data_carmillas/1.json
  def show
  end

  # GET /distribution_data_carmillas/new
  def new
    @distribution_data_carmilla = DistributionDataCarmilla.new
  end

  # GET /distribution_data_carmillas/1/edit
  def edit
  end

  # POST /distribution_data_carmillas or /distribution_data_carmillas.json
  def create
    @distribution_data_carmilla = DistributionDataCarmilla.new(distribution_data_carmilla_params)

    respond_to do |format|
      if @distribution_data_carmilla.save
        format.html { redirect_to distribution_data_carmilla_url(@distribution_data_carmilla), notice: "Distribution data carmilla was successfully created." }
        format.json { render :show, status: :created, location: @distribution_data_carmilla }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @distribution_data_carmilla.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /distribution_data_carmillas/1 or /distribution_data_carmillas/1.json
  def update
    respond_to do |format|
      if @distribution_data_carmilla.update(distribution_data_carmilla_params)
        format.html { redirect_to distribution_data_carmilla_url(@distribution_data_carmilla), notice: "Distribution data carmilla was successfully updated." }
        format.json { render :show, status: :ok, location: @distribution_data_carmilla }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @distribution_data_carmilla.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distribution_data_carmillas/1 or /distribution_data_carmillas/1.json
  def destroy
    @distribution_data_carmilla.destroy

    respond_to do |format|
      format.html { redirect_to distribution_data_carmillas_url, notice: "Distribution data carmilla was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constRails.root.join('app', 'controllers', 'dat', 'distribCarmil.csv')raints between actions.
    def set_distribution_data_carmilla
      @distribution_data_carmilla = DistributionDataCarmilla.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def distribution_data_carmilla_params
      params.require(:distribution_data_carmilla).permit(:words, :frequency, :ratio)
    end
end
