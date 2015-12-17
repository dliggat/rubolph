require 'date'

module Rubolph
  class Packager

   def initialize(results)
     @results = results
   end

   def package(year=Date.today.year)
    @results.each do |giver, receiver|
      File.open("./output/#{giver}.txt", 'w') do |f|
        f.puts "Hello #{giver.capitalize}. For Christmas #{year}, you're buying a present for #{receiver.capitalize}."
      end
    end
   end

  end
end
