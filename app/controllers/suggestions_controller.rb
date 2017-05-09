class SuggestionsController < ApplicationController
def index
   @blist = List.find(params[:list_id])
   @suggestions = @list.suggestions
 end

 def new
   if current_user.present?
     @list = List.find(params[:list_id])
     @suggestion = Suggestion.new
   else
     flash[:error] = "Please log in before trying to submit a suggestion!"
     redirect_to root_path
   end
 end

 def create
   @list = List.find(params[:list_id])
   @suggestion = Suggestion.new(suggestion_params)
   @suggestion.list = @list
   @suggestion.user = current_user
   list_owner = @list.user
   if @suggestion.save
     redirect_to list_path(@list)
   else
     @errors = @suggestion.errors.full_messages
     render :new
   end
 end




 private

 def suggestion_params
   params.require(:suggestion).permit(
     :show_name,
     :description
   )
 end
end
