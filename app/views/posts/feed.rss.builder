xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
    xml.channel do
        xml.title @title
        xml.description "Of VC, Technology and geekness"
        xml.link posts_url

        for post in @posts
            xml.item do
                xml.title post.title
                xml.description sanitize( Kramdown::Document.new(post.body).to_html, :type => 'html')
                xml.pubDate(post.published_at.nil? ? nil : post.published_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
                xml.link post_url(post)
                xml.guid post_url(post)
            end
        end
    end
end
