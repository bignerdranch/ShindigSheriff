require 'spec_helper'

describe UserMailer do

  context "#registration_email" do
    before(:each) do
      @current_user = FactoryGirl.build(:user)
      @current_user.roles << Role.find_or_create_by(name: "organizer")

      @organization = Organization.find_or_create_by(name: "Puppies")

      @invited_user = FactoryGirl.build(:user, :not_verified)
      @invited_user.roles << Role.find_or_create_by(name: "organizer")


      @mail = UserMailer.registration_email(
                                      user: @invited_user,
                                      organization_name: @organization.name,
                                      organizer_name: @current_user.display_name)
    end

    it "is addressed to the unregistered finance approver" do
      @mail.to.should == [@invited_user.email]
    end

    it "should have a temporary password" do
      @mail.body.encoded.should match(@invited_user.password)
    end

    it "should have the organizers name" do
      @mail.body.encoded.should match(@current_user.display_name)
    end

    it "should have organization name" do
      @mail.body.encoded.should match(@organization.name)
    end

    it 'renders the sender email' do
      @mail.from.should == ['ShindigSheriff@gmail.com']
    end
  end
end
