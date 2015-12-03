module Rubolph
  class Packager

   def initialize(results)
     @results = results
   end

   def package
    @results.each do |giver, receiver|
      open("./output/#{giver}.txt", 'w') do |f|
        f.puts "Hello #{giver.capitalize}. For Christmas 2015, you're buying a present for #{receiver.capitalize}."
      end
    end
   end

  end
end
