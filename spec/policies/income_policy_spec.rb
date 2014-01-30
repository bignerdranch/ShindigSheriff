require 'spec_helper'
require 'authorization_helper'

describe IncomePolicy do 
  subject { IncomePolicy.new(user, action) }
  let(:action) { FactoryGirl.create(:income) }

  context "organizer" do
    let(:user) { FactoryGirl.build(:user) }

    before(:each) do 
      user.roles << Role.find_or_create_by(name: "organizer")
      user.save!
    end

    it { should permit(:new)        }
    it { should permit(:create)     }
    it { should permit(:destroy)    }
    it { should_not permit(:verify) }
    it { should_not permit(:reject) }
  end

  context "finance approver" do
    let(:user) { FactoryGirl.build(:user) }

    before(:each) do 
      user.roles << Role.find_or_create_by(name: "finance approver")
      user.save!
    end

    it { should_not permit(:new)     }
    it { should_not permit(:create)  }
    it { should_not permit(:destroy) }
    it { should permit(:verify)      }
    it { should permit(:reject)      }
  end
end