class InformationTypesController < ApplicationController
    before_action :authenticate_user!, except: [:index] #required user logged
    before_action :set_information_type, only: [:show, :edit, :update, :destroy]
  def index
    @information_types = InformationType.all
  end

  def show
  end

  def new
    @information_type = InformationType.new
  end

  def edit
  end

  def create
    @information_type = InformationType.new(information_type_params)
    respond_to do |format|
      if @information_type.save
        format.html { redirect_to @information_type, notice: 'Information type was successfully created.' }
        format.json { render :show, status: :created, location: @information_type }
      else
        format.html { render :new }
        format.json { render json: @information_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @information_type.update(information_type_params)
        format.html { redirect_to @information_type, notice: 'Information type was successfully updated.' }
        format.json { render :show, status: :ok, location: @information_type }
      else
        format.html { render :edit }
        format.json { render json: @information_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @information_type.destroy
    respond_to do |format|
      format.html { redirect_to information_type_url, notice: 'Information type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_information_type
      @information_type = InformationType.find(params[:id])
    end

  private 
    def information_type_params
      params.require(:information_type).permit(:description, :active)
    end

end
