class ShowsController < ApplicationController
  require 'httparty'

  def index
    @shows = Show.all
    @user = current_user
  end

  def show
    @show = Show.find(params[:id])
    @user = current_user
  end


  def searchAPI
    if current_user.present?
     @shows = Show.all
     userinput = params[:userinput]
     userinput = userinput.split(' ').join('-')
     response = HTTParty.get("http://api-public.guidebox.com/v2/search?api_key=7b5cad93d7d43098874c81270fd414d8ff60fa9b&type=show&field=title&query=#{userinput}")
     json_response = JSON.parse(response.body)
     json_response["results"].each do |result|
       id = result["id"]
       show_details = HTTParty.get("http://api-public.guidebox.com/v2/shows/#{id}/available_content\?api_key\=7b5cad93d7d43098874c81270fd414d8ff60fa9b&limit=1")
       json_show_details = JSON.parse(show_details.body)
       Show.find_or_create_by!(title: result["title"]) do |show|
         show.image_url = result["poster_400x570"]
         show.description = json_show_details["overview"]
         puts "Show added to your list."
       end
       show = Show.find_by(title: result["title"])
     end
   end
 end
 end
