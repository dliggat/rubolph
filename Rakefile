require 'fileutils'
require 'rubolph'
require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :rubolph do

  task :generate, :options do |_, args|
    participants = [ :dad, :mum, :dave, :martyn, :caroline, :lisa ]
    exclusions   = { dad:  :mum,
                     mum:  :dad,
                     dave: :lisa,
                     lisa: :dave }
    picker       = Rubolph::Picker.new participants, exclusions
    results      = picker.pick

    packager     = Rubolph::Packager.new results
    packager.package
  end

  task :clean, :options do |_, args|
    FileUtils.rm(Dir.glob './output/*.txt')
  end

end
