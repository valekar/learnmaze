class FeedEntry < ActiveRecord::Base
  attr_accessible :guid, :name, :published_at, :summary, :url



  # @param [Object] feed_url

  #feed = Feedzirra::Feed.fetch_and_parse("http://feeds.feedburner.com/PaulDixExplainsNothing",:on_success => lambda [|url, feed| puts feed.title ],:on_failure => lambda [|url, response_code, response_header, response_body| puts response_body ])

  def self.update_from_feed_continuously(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    feed = Feedzirra::Feed.update(feed)
    if feed
      #feed.sanitize_entries!
      add_entries(feed.new_entries)
    end

  end

  def self.update_from_feed(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    #feed.sanitize_entries!
    add_entries(feed.entries)
  end

  private
  def self.add_entries(entries)
    #feed = Feedzirra::Feed.fetch_and_parse(feed_url)

    entries.each do |entry|

     #if strip_links(strip_tags(entry.summary))

      unless exists? :guid => entry.id
        create!(
            name:entry.title,
            summary:entry.content,
            url:entry.url,
            published_at:entry.published,
            guid:entry.id

        )
      end
     #end
    end
  end

end
