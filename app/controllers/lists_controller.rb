class ListsController < ApplicationController

  def index
    @lists = List.all.order("created_at DESC")
  end

  def show
    @list = List.find(params[:id])
    @suggestions = @list.suggestions
  end

  def new
    if current_user.present?
      @list = List.new
    else
      flash[:error] = "Please log in before trying to submit a list!"
      redirect_to root_path
    end
  end

  def create
    @list = List.new(list_params)
    @list.user= current_user
    if @list.save
      flash[:notice] = "list submitted successfully!"
      redirect_to list_path(@list)
    else
      @errors = @list.errors.full_messages
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(list_params)
    if @list.save
      flash[:success] = 'list successfully edited!'
      redirect_to list_path(@list)
    else
      @errors = @list.errors.full_messages
      render :new
    end
  end

  def destroy
      @list = List.find(params[:id])
      @list.suggestions.destroy_all
      @list.destroy
      flash[:success] = "list deleted"
      redirect_to root_path
      end
  end

  private

  def list_params
    params.require(:list).permit(
      :title,
      :body
    )
  end
