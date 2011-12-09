def parse_options
  options = {}
  optparser = OptionParser.new do |opts|
    opts.banner = "Usage: what_to_pack.rb --in FILE --out FILE --weather WEATHER"
  
    opts.on('-i', '--in FILE', 'Input packing list with conditions', 'CSV with no headers and two columns for item and when to pack the item') do |file|
      options[:in] = file
    end

    opts.on('-o', '--out FILE', 'Filtered packing list') do |file|
      options[:out] = file
    end

    opts.on('-w', '--weather x,y,z', Array,
            'List of weather conditions (dry, rainy, cold)') do |weather|
      options[:weather] = weather
    end
  end
  optparser.parse!
  
  if options[:in].nil? || options[:weather].nil?
    puts optparser.help
    exit
  end

  options
end

