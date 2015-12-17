require 'spec_helper'

describe Rubolph::Packager do

  before :each do
    @participants = [:dad, :mum]
    @exclusions   = { }
    @picker       = Rubolph::Picker.new @participants, @exclusions
    @results      = @picker.pick
  end

  it 'should write the results to file' do
    file = mock('file')
    File.expects(:open).twice.yields(file)
    file.expects(:puts).twice
    packager = described_class.new @results
    packager.package
  end

end
