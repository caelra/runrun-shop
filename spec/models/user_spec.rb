# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }

  describe 'enums' do
    it { should define_enum_for(:role).with_values(%i[user admin]) }
  end

  describe 'validations' do
    it { described_class.validators.map(&:class).include? User::EmailValidator }
  end
end
