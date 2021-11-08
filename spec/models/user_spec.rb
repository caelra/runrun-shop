# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  password_digest :string
#  role            :integer          default("user")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
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
