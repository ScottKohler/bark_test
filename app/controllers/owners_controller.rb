# not used

class OwnersController < ApplicationController
before_action :set_owner, only: [:show, :edit, :update, :destroy]

  def index
    @dog = Dog.first  #temp assn - need to be passed in
    @users = User.all
  end

  # select user u
  # @dog.users << u

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @dog = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:name, :description, :images)
    end

end
