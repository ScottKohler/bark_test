class DogsController < ApplicationController
  before_action :set_dog, only: [ :show, :edit, :update, :destroy, :like]

  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.all
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
  end

  # GET /dogs/new
  def new
    #@d= nil
    id = Dog.all.collect{|d| d.id}.sample
    if !id.nil?
      @d = Dog.find(id) if !id.nil?
    else
      @d= nil
    end

    @dog = Dog.new
    @users = User.all.order(:name)
  end

  # GET /dogs/1/edit
  def edit
    # p '____in edit___'
    # @dog = Dog.find(1)
    @users = User.all#.order(:name)
  end

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = Dog.new(dog_params)

    respond_to do |format|
      if @dog.save
        @dog.images.attach(params[:dog][:image]) if params[:dog][:image].present?

        format.html { redirect_to @dog, notice: 'Dog was successfully created.' }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1
  # PATCH/PUT /dogs/1.json
  def update
    respond_to do |format|

      if @dog.update(dog_params)
        if !params[:users].blank?
          @dog.users << User.find(params[:users])
        end

        @dog.images.attach(params[:dog][:image]) if params[:dog][:image].present?
        format.html { redirect_to @dog, notice: 'Dog was successfully updated.' }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to dogs_url, notice: 'Dog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    p 'dog likes'
    @dog.likes << Like.new
    redirect_to @dog
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:name, :description, :images, :users)
    end
end
