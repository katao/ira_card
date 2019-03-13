class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)

    if @content.save
      redirect_to @content, notice: 'Content was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    if @content.update(content_params)
      redirect_to @content, notice: 'Content was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    redirect_to contents_url, notice: 'Content was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:rarity_id, :title, :comment)
    end
end
