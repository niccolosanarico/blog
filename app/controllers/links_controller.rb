class LinksController < ApplicationController
  def new
  end

  def create
    link = Link.new(:title => params[:link_title], :link => params[:link_link], :section => params[:link_section])

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
    @sections = Link.pluck('DISTINCT section')

    @links = Link.order("created_at desc")

    @sections_with_links = Hash.new

    @sections.each do |section|
      @sections_with_links[section] = @links.select { |link| link.section == section }
    end

  end

  def update
    link = Link.find(params[:id])
    link.title = params[:link_title]
    link.link = params[:link_link]
    link.section = params[:link_section]

    if(link.save)
      redirect_to links_path
    else
      render :edit, link
    end

  end

  def destroy
    Link.find(params[:id]).destroy
    redirect_to links_path
  end
end
