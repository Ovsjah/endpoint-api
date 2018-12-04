require 'rails_helper'

# Test suite for the Provider model
RSpec.describe Provider, type: :model do
  let(:provider) { create(:provider) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:amount) }

  context 'when email is valid' do
    it 'is not too long' do
      expect(provider.email.size).to be < 255
    end

    it 'is uniq' do
      duplicate_user = provider.dup
      expect(duplicate_user).not_to be_valid
    end

    it 'saves email as lower-case' do
      mixed_case_email = "Foo@ExAMPle.CoM"
      provider.email = mixed_case_email
      provider.save
      expect(provider.email).to eq(mixed_case_email.downcase)
    end

    it 'accepts valid addresses' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        provider.email = valid_address
        expect(provider).to be_valid
      end
    end
  end

  context 'when email is invalid' do
    it 'rejects invalid addresses' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                             foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      invalid_addresses.each do |invalid_address|
        provider.email = invalid_address
        expect(provider).not_to be_valid
      end
    end
  end
end
