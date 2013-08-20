require 'spec_helper'

describe Deal do
  it { should belong_to :business }

  it { should validate_presence_of :business }
  it { should validate_presence_of :responsible_user }
  it { should validate_presence_of :responsible_account }
  it { should validate_presence_of :title }

  describe "on creation" do
    describe "without :began_on" do
      it "sets began_on to Today" do
        d = build(:deal, began_on: nil)
        d.save!
        d.began_on.should == Date.today
      end
    end
    describe "with :began_on" do
      it "wont override began_on" do
        d = build(:deal, began_on: Date.yesterday)
        d.save!
        d.began_on.should == Date.yesterday
      end
    end
  end
end
