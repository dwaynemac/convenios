require 'spec_helper'

describe Business do
  it { validates_presence_of :name }
end
