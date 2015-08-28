class FactoriallsController < ApplicationController
  before_action :set_factoriall, only: [:show, :edit, :update, :destroy]

  # GET /factorialls
  # GET /factorialls.json
  def index
    @factorialls = Factoriall.all
    if @factorialls.empty?
      Thread.new do
        res = BigDecimal.new(0)
        5.times do |n|
          st = n == 0 ? 1 : 26**n + 1
          en = 26**(n+1)
          res = (st..en).inject(res){|sum, k| sum + Math.log2(k)}
          Factoriall.create n: (n+1), result: res.to_s
        end
      end
    end
  end

  # GET /factorialls/1
  # GET /factorialls/1.json
  def show
  end

  # GET /factorialls/new
  def new
    @factoriall = Factoriall.new
  end

  # GET /factorialls/1/edit
  def edit
  end

  # POST /factorialls
  # POST /factorialls.json
  def create
    @factoriall = Factoriall.new(factoriall_params)

    respond_to do |format|
      if @factoriall.save
        format.html { redirect_to @factoriall, notice: 'Factoriall was successfully created.' }
        format.json { render :show, status: :created, location: @factoriall }
      else
        format.html { render :new }
        format.json { render json: @factoriall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factorialls/1
  # PATCH/PUT /factorialls/1.json
  def update
    respond_to do |format|
      if @factoriall.update(factoriall_params)
        format.html { redirect_to @factoriall, notice: 'Factoriall was successfully updated.' }
        format.json { render :show, status: :ok, location: @factoriall }
      else
        format.html { render :edit }
        format.json { render json: @factoriall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factorialls/1
  # DELETE /factorialls/1.json
  def destroy
    @factoriall.destroy
    respond_to do |format|
      format.html { redirect_to factorialls_url, notice: 'Factoriall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factoriall
      @factoriall = Factoriall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factoriall_params
      params.require(:factoriall).permit(:n, :result)
    end
end
