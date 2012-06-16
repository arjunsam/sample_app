# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean         default(FALSE)
#

require 'spec_helper'

describe User do

  before { @user = User.new(name: "Test", email: "Test@test.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

end
