require 'fileutils'
require 'rubolph'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'yaml'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :rubolph do

  task :generate, :options do |_, args|
    input    = YAML::load_file 'participants.yml'
    picker   = Rubolph::Picker.new input['participants'], input['exclusions']
    results  = picker.pick
    packager = Rubolph::Packager.new results
    packager.package
  end

  task :clean, :options do |_, args|
    FileUtils.rm(Dir.glob './output/*.txt')
  end

end
