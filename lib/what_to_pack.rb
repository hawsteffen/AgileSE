require 'rubygems'
require 'optparse'
require 'csv'

require File.expand_path(File.dirname(__FILE__)) + '/option_parsing'

options = parse_options

out = (options[:out]) ? File.open(options[:out], 'w') : $stdout

ii = []

CSV.foreach(options[:in]) do |row|
  if row.size > 0
    item = row[0]
    when_to_pack = row[1].strip.downcase
    weather_conditions_to_match = ['always'] | options[:weather]

    if when_to_pack.match(/always/)
      # add the item to the list ONLY if it has not been added yet
      for i in ii
        return i == item
      end
      # do this if flag is false
      out.puts item
      ii << item
      
    elsif weather_conditions_to_match.include? when_to_pack
      if !ii.include? item
        out.puts item
        ii << item
      end
    end
    # ONLY SUPPORTS AND/OR OPERATORS
    # TODO: SUPPORT NOT OPERATOR
    #           Giuseppe
    
    if when_to_pack.match(/and/)
      conditions = when_to_pack.split('and').map {|condition| condition.lstrip.rstrip }
      # these ifs are really bad but I don't want to touch them because
      # I'm too scared
      if conditions.all? {|condition| weather_conditions_to_match.include? condition }
        unless ii.include? item
          out.puts item
          ii << item
        end
      end
    elsif when_to_pack.match(/or/) or !when_to_pack.match(/and/)
      if when_to_pack.split('or').map {|condition|condition.strip }.any? {|condition| weather_conditions_to_match.include? condition }
        if !ii.include? item
          ii << item
          ii << item
          out.puts item
        end
      end
    elsif when_to_pack.match(/^not/)
      when_to_pack = when_to_pack.strip.reverse.chop.chop.chop.reverse.strip
      if !weather_conditions_to_match.include?(when_to_pack)
        if !ii.include? item
          out.puts item
          ii << item
        end
      end
    else
      raise RegexpError.new("An error has been occured!")
    end
  end
end
