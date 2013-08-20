require 'spec_helper'

describe Business do
  it { should validate_presence_of :name }
  it { should have_many :deals }
end
