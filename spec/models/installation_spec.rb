require 'rails_helper'

RSpec.describe Installation, type: :model do

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:repo) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:website) }
  it { is_expected.to respond_to(:contact_name) }
  it { is_expected.to respond_to(:conact_email) }
  it { is_expected.to respond_to(:location) }
  it { is_expected.to respond_to(:organization_type) }
  it { is_expected.to respond_to(:status) }
  it { is_expected.to respond_to(:notes) }

  it "is valid with valid attributes" do
    expect(Installation.new(name: 'foo', repo: 'bar')).to be_valid
  end

  it "is not valid with empty attributes" do
    expect(Installation.new).not_to be_valid
  end

  it "is not valid with repeated 'repo' attribute" do
    Installation.new(repo: 'foo')
    expect(Installation.new(repo: 'foo')).not_to be_valid
  end
end
