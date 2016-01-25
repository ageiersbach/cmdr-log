require 'rails_helper'

describe CmdrsController do
  describe "#index" do
    let(:cmdrs) do
      [
        create(:cmdr, name: 'Gendibal'),
        create(:cmdr, name: 'Fuwwaz')
      ]
    end

    it "is successful" do
      get :index
      expect(response).to be_success
    end

    it "gets the cmdrs" do
      get :index
      expect(assigns(:cmdrs)).to eq(cmdrs)
    end

    it "sets the session store for current_cmdr to nil" do
      session[:current_cmdr_id] = cmdrs.first.id
      get :index
      expect(session[:current_cmdr_id]).to be_nil
    end
  end

  describe "#show" do
    let(:cmdr) { create(:cmdr) }
    it "is successful" do
      get :show, id: cmdr.id
      expect(response).to be_success
    end

    it "sets the session store for the given cmdr" do
      expect(session[:current_cmdr_id]).to be_nil #sanity
      get :show, id: cmdr.id
      expect(session[:current_cmdr_id]).to eq(cmdr.id)
    end

    it "assigns the cmdr" do
      get :show, id: cmdr.id
      expect(assigns(:current_commander)).to eq(cmdr)
    end
  end

  describe "#new" do
    it "initializes a new Cmdr" do
      get :new
      expect(assigns(:cmdr)).to be_a_new Cmdr
    end

    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  describe "#create" do
    context "with valid params" do
      let(:valid_params) do
        { cmdr: { name: 'Gendibal', ships_attributes:
          { "0" => { model: "Asp Explorer", cargo_capacity: '45' } }
        } }
      end

      it "redirects to @cmdr" do
        post :create, valid_params
        expect(response).to redirect_to(cmdr_path(assigns(:cmdr)))
      end

      it "creates a new Cmdr" do
        expect {
          post :create, valid_params
        }.to change{ Cmdr.count }.from(0).to(1)
      end

      it "creates a new Ship" do
        expect {
          post :create, valid_params
        }.to change{ Ship.count }.from(0).to(1)
      end
    end

    context "with invalid params" do
      let(:invalid_params) { { cmdr: { master_rank: true } } }

      it "renders the new template" do
        post :create, invalid_params
        expect(response).to render_template("new")
      end

      it "does not create a new Cmdr" do
        expect {
          post :create, invalid_params
        }.to_not change{ Cmdr.count }
      end
    end
  end
end
