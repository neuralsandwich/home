#!/usr/bin/env ruby

require 'date'
require 'time_diff'

class Deadline

  attr_accessor :event
  attr_accessor :deadline

  def initialize(event, deadline)
    @event=event
    @deadline=DateTime.parse(deadline)
  end

  def time_until()
    time_until = Time.diff(DateTime.now, deadline)
    print "#{event} : "
    if time_until[:year] > 0
      print "#{time_until[:year]} years "
    end
    if time_until[:month] > 0
      print "#{time_until[:month]} months "
    end
    if time_until[:week] > 0
      print "#{time_until[:week]} weeks "
    end
    if time_until[:day] > 0
      print "#{time_until[:day]} days "
    end
    if time_until[:hour] > 0
      print "#{time_until[:hour]} hours "
    end
    if time_until[:minute] > 0
      print "#{time_until[:minute]} minutes "
    end
    if time_until[:second] > 0
      print "#{time_until[:second]} seconds "
    end
    print "left\n"
  end
end

#### Main Program

counter = 1

begin
  file = File.new(ENV['HOME']+"/.dot/deadlines", "r")
  while (line = file.gets)
    e, m, d = line.partition(":")
    d = Deadline.new(e, d)
    d.time_until
    counter = counter + 1
  end
  file.close
rescue => err
  puts "Execption: #{err}"
  err
end
