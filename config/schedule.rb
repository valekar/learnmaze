set :output ,"#{path}/log/cron.log"



every :reboot do
  rake "sunspot:solr:start"
end