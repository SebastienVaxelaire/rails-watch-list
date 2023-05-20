class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def index
    @lists = List.all
  end

  def show
    @review = Review.new
    @reviews = Review.where(list: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :image_url)
  end
end
