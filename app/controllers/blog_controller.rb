class BlogController < ApplicationController

    def index
        @posts = Post.paginate(page: params[:page], :per_page=>7).where(:status=>'public').order(:published_at).reverse_order
    end

    def thanks

    end
end
