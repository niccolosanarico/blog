class LinksController < ApplicationController
  def new
  end

  def create
    link = Link.new(:title => params[:link_title], :link => params[:link_link])

    if(link.save)
      redirect_to links_path
    else
      render :new
    end

  end

  def edit
    @link = Link.find(params[:id])
  end

  def index
    @links = Link.order(order: :desc)
  end

  def update
    link = Link.find(params[:id])
    link.title = params[:link_title]
    link.link = params[:link_link]

    if(link.save)
      redirect_to links_path
    else
      render :edit, link
    end

  end
end
