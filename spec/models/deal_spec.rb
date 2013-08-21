require 'spec_helper'

describe Deal do
  it { should belong_to :business }

  it { should validate_presence_of :business }
  it { should validate_presence_of :user }
  it { should validate_presence_of :account }
  it { should validate_presence_of :title }

  describe "on creation" do
   describe "with :federation_id" do
      it 'caches federation name' do
        NucleoClient::Federation.stub(:find).with(1).and_return(NucleoClient::Federation.new(name: 'fed-name'))
        d = create(:deal, federation_id: 1)
        d.cached_federation_name.should == 'fed-name'
      end
    end
    describe "wihout :federation_id" do
      it 'wont call nucleo' do
        NucleoClient::Federation.should_not_receive :find
        create(:deal)
      end
    end
  end
  describe "on save" do
    describe "when federation_id changes" do
      it "caches new federation name" do
        NucleoClient::Federation.stub(:find).with(1).and_return(NucleoClient::Federation.new(name: 'fed-name'))
        NucleoClient::Federation.stub(:find).with(2).and_return(NucleoClient::Federation.new(name: 'fed-new-name'))
        d = create(:deal, federation_id: 1)
        d.federation_id = 2
        d.save
        d.cached_federation_name.should == 'fed-new-name'
      end
    end
    describe "when federation_id doesnot change" do
      it "doesnot call nucleo" do
        NucleoClient::Federation.stub(:find).with(1).and_return(NucleoClient::Federation.new(name: 'fed-name'))
        d = create(:deal, federation_id: 1)
        NucleoClient::Federation.should_not_receive(:find)
        d.save
      end
    end
  end
end
