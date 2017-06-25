require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:phone_numbers) }
end
