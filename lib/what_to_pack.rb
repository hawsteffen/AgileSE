require 'rubygems'
require 'optparse'
require 'csv'

require File.expand_path(File.dirname(__FILE__)) + '/option_parsing'
require File.expand_path(File.dirname(__FILE__)) + '/methods'

options = parse_options

out = (options[:out]) ? File.open(options[:out], 'w') : $stdout

items = []

CSV.foreach(options[:in]) do |row|
  if row.size > 0
    item = row[0]
    when_to_pack = row[1].strip.downcase
    weather_conditions_to_match = ['always'] | options[:weather]

    if when_to_pack.match(/always/)
      checkItems(out,item,items)            
    elsif weather_conditions_to_match.include? when_to_pack
      checkNotIncludeItems(out,item,items)
    end
    # ONLY SUPPORTS AND/OR OPERATORS
    # TODO: SUPPORT NOT OPERATOR
    #           Giuseppe
    
    if when_to_pack.match(/and/)
      conditions = when_to_pack.split('and').map {|condition| condition.lstrip.rstrip }
      checkConditions(conditions,weather_conditions_to_match,items,item,out)
    elsif when_to_pack.match(/or/) or !when_to_pack.match(/and/)
      if when_to_pack.split('or').map {|condition|condition.strip }.any? {|condition| weather_conditions_to_match.include? condition }
        checkNotIncludeItems(out,item,items)
      end
    elsif when_to_pack.match(/^not/)
      when_to_pack = when_to_pack.strip.reverse.chop.chop.chop.reverse.strip
      if !weather_conditions_to_match.include?(when_to_pack)
        checkNotIncludeItems(out,item,items)
      end
    else
      raise RegexpError.new("An error has been occured!")
    end
  end
  
end




