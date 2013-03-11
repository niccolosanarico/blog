class PostsController < ApplicationController

    def new
    end

    def create
        post = Post.new(:title=>params[:title], :body=>params[:body], :tags=>params[:tags])

        if(params[:publish])
            post.status="public";
            if(post.published_at.nil?)
                post.published_at = Time::now
            end
            post.save  
        end

        if(params[:save])
            post.status="draft"; 
            post.save  
            redirect_to edit_post_path(:id=>post.id)
        end

    end

    def index
        @posts = Post.paginate(page: params[:page], :per_page=>10).order('id DESC')
    end

    def edit
        @post = Post.find(params[:id])
    end

    def show
        @post = Post.find(params[:id])
        if(@post.status != 'public')
            flash.now["alert"] = "The post you are looking for does not exist"
            @post = nil
        end
    end

    def archive
        @posts = Post.paginate(page: params[:page], :per_page=>20).where(:status=>'public').order('created_at DESC')
    end

    def update
        post = Post.find(params[:id])
        post.title = params[:title]
        post.body = params[:body]
        post.tags = params[:tags]

        if(params[:publish])
            post.status="public";
            if(post.published_at.nil?)
                post.published_at = Time::now
            end
            post.save  
            redirect_to post_path(:id=>post.id)
        end

        if(params[:save])
            post.status="draft"; 
            post.save  
            redirect_to edit_post_path(:id=>post.id)
        end
    end

    def feed
        @title = "A Pinch of Value"

        @posts = Post.where(:status=>'public').order("published_at desc")

        @updated = @posts.first.updated_at unless @posts.empty?

        respond_to do |format|
            format.atom { render :layour => false }

            format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
        end
    end
end
