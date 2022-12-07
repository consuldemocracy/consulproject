require 'rails_helper'

RSpec.describe InstallationsController, type: :controller do

  let(:valid_session) { {} }
  let(:installation) { create(:installation) }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: installation.id.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    let(:installation_params) {
      {
        name: Faker::Lorem.sentence,
        repo: Faker::Internet.url('github.com'),
        website: Faker::Internet.url,
        contact_name: Faker::Name.name_with_middle,
        conact_email: Faker::Internet.email,
        location: Faker::Address.full_address,
        organization_type: Installation.organization_types.keys.sample,
        status: Installation.installation_statuses.keys.sample,
        notes: Faker::Lorem.paragraph,
      }
    }

    context "with valid params" do
      it "creates a new Installation" do
        expect {
          post :create, params: {installation: installation_params}, session: valid_session
        }.to change(Installation, :count).by(1)
      end

      it "redirects to the created installation" do
        post :create, params: {installation: installation_params}, session: valid_session
        expect(response).to redirect_to(Installation.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {installation: {foo: 'foo', bar: 'bar'}}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

end
