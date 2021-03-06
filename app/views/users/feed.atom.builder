atom_feed :language => 'en-US' do |feed|
   feed.title @title
   feed.updated @updated

   @feed_items.each do |item|
     next if item.updated_at.blank?

     feed.entry( item ) do |entry|
       entry.url page_path_helper(item)
       entry.title item.title

       entry.content :type => 'html' do
        entry.cdata!(kramdown item.content)
      end
       # the strftime is needed to work with Google Reader.
       entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
  
       entry.author @user.name


     end
   end
end