require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new


#scheduler.every '1m' do
 # FeedEntry.update_from_feed("http://feeds.feedburner.com/TechCrunch/startups")
#end





scheduler.every '1d' do
  #rake "sunspot:solr:start",:environment => :development
  FeedEntry.update_from_feed("http://www.theengineer.co.uk/XmlServers/navsectionRSS.aspx?navsectioncode=210")
end




scheduler.every '1d'  do
  FeedEntry.update_from_feed_continuously("http://www.theengineer.co.uk/XmlServers/navsectionRSS.aspx?navsectioncode=210")
end