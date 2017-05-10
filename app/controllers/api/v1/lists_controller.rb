class Api::V1::ListsController < ApiController

  def index
    @lists = List.all
    render json: @lists
  end

end
