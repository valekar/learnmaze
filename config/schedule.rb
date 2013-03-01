#set :output ,"#{path}/log/cron.log"



#every :reboot do
 # rake "sunspot:solr:start",:environment => :development
  #runner FeedEntry.update_from_feed("http://feeds.feedburner.com/TechCrunch/startups"),:environment => :development
#end




#every 1.minute   do
 # runner FeedEntry.update_from_feed_continuously("http://feeds.feedburner.com/TechCrunch/startups"),:environment => :development
#end