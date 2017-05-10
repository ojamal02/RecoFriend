class SearchesController < ApplicationController
  def index
    if params[:search] == ""
      @blank_message = "You have submitted a empty query"
    else
      @lists = List.search(params[:search])
      if @lists == []
        @blank_message = "Searches have not resulted in any matches!"
      end
    end
  end
end
