# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
require "tzinfo"
 
def local(time)
        TZInfo::Timezone.get('Asia/Seoul').local_to_utc(Time.parse(time))
end

 
# [매일] 공지사항 (/config/schedule.rb)
every :day, at: local('5:10 am') do
    rake "crawling_notice:crawling_notice"
end