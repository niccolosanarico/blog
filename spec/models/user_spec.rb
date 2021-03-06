# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

require 'spec_helper'

describe User do
    let (:user) { FactoryGirl.create(:user) }

    #before { @user = User.new(:name => "Nico Sana", :email => "nico@nico.com",
    #                          :password => "foobar", :password_confirmation => "foobar") }

    subject { user }

    it { expect(subject).to respond_to(:name) }
    it { expect(subject).to respond_to(:email) }
    it { expect(subject).to respond_to(:password_digest) }
    it { expect(subject).to respond_to(:password) }
    it { expect(subject).to respond_to(:password_confirmation) }
    it { expect(subject).to respond_to(:remember_token) }
    it { expect(subject).to respond_to(:authenticate) }

    it { expect(subject).to be_valid }

    describe "when name is not present" do
        before { user.name = " " }
        it {expect(subject).to_not be_valid }
    end

    describe "when password is not present" do
        before { user.password = user.password_confirmation = " " }
        it {expect(subject).to_not be_valid }
    end

    describe "when password doesn't match confirmation" do
        before { user.password_confirmation = "mismatch" }
        it {expect(subject).to_not be_valid }
    end

    describe "when password confirmation is nil" do
        before { user.password_confirmation = nil }
        it {expect(subject).to_not be_valid }
    end

    describe "return value of authenticate method" do
        before { user.save }
        let(:found_user) { User.find_by_email(user.email) }

        describe "with valid password" do
            it { expect(subject).to eq(found_user.authenticate(user.password)) }
        end

        describe "with invalid password" do
            let(:user_for_invalid_password) { found_user.authenticate("invalid") }

            it { expect(subject).to_not eq(user_for_invalid_password) }
            specify { expect(user_for_invalid_password).to be false }
        end

        describe "with a password that's too short" do
            before { user.password = user.password_confirmation = "a" * 5 }
            it { expect(subject).to be_invalid }
        end
    end

    describe "Remember token" do
        before { user.save }
        it(:remember_token) { should_not be_blank }
    end
end
