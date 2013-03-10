atom_feed :language => 'en-US' do |feed|
    feed.title @title
    feed.updated @updated

    @posts.each do |item|
        next if item.updated_at.blank?

        feed.entry( item ) do |entry|
            #entry.url post_url(item)
            entry.title item.title
            entry.content item.body, :type => 'html'

            # the strftime is needed to work with Google Reader.
            
            entry.updated(item.published_at.nil? ? nil : item.published_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

            entry.author do |author|
                author.name(entry.author_name)
            end
        end
    end
end