class BlogController < ApplicationController

    def index
        @posts = Post.where(:status=>'public').order(:created_at).reverse_order
    end

    def thanks

    end
end

