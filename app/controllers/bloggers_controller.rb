class BloggersController < ApplicationController
  before_action :set_blogger, only: [:show, :edit, :update]
  def index
    @bloggers = Blogger.all
  end

  def edit
  end

  def update
    @blogger.update(blogger_params(:name,:bio,:age))
    redirect_to blogger_path(@blogger)
  end

  def show
  end

  def new
    @blogger = Blogger.new
  end

  def create
    new_blogger = Blogger.create(blogger_params(:name,:bio,:age))
    if new_blogger.valid?
      redirect_to blogger_path(new_blogger)
    else
      redirect_to new_blogger_path
    end

  end

  private

  def set_blogger
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params(*args)
    params.require(:blogger).permit(*args)
  end

end
