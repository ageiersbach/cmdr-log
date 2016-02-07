require 'rails_helper'

describe EntriesController do
  let!(:cmdr) { create(:cmdr) }

  before do
    @request.session['current_cmdr_id'] = cmdr.id
  end

  describe "GET #show" do
    let(:entry) { create(:entry, cmdr: cmdr) }

    it "returns http success" do
      get :show, cmdr_id: cmdr.id, id: entry.id
      expect(response).to have_http_status(:success)
    end

    it "assigns @entry" do
      get :show, cmdr_id: cmdr.id, id: entry.id
      expect(assigns(:entry)).to eq(entry)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, cmdr_id: cmdr.id
      expect(response).to have_http_status(:success)
    end

    it "builds a new entry" do
      get :new, cmdr_id: cmdr.id
      expect(assigns(:entry)).to be_a_new Entry
      expect(assigns(:entry).cmdr).to eq(cmdr)
    end
  end

  describe "GET #destroy" do
    let!(:entry) { create(:entry, cmdr: cmdr) }

    it "redirects to cmdr path" do
      get :destroy, cmdr_id: cmdr.id, id: entry.id
      expect(response).to redirect_to(cmdr_path(cmdr))
    end

    it "destroys the entry" do
      expect {
        get :destroy, cmdr_id: cmdr.id, id: entry.id
      }.to change{ Entry.count }.from(1).to(0)
    end
  end

  describe "#create" do
    let(:system_object) { create(:system_object) }
    context "with valid params" do
      let(:valid_params) do
        { entry: { system_object_id: system_object.id, activity_id: "1" } }
      end

      it "redirects to entry#show" do
        post :create, valid_params.merge({ cmdr_id: cmdr.id })
        expect(response).to redirect_to(cmdr_entry_path(cmdr, assigns(:entry)))
      end

      it "creates a new entry" do
        expect {
          post :create, valid_params.merge({ cmdr_id: cmdr.id })
        }.to change{ Entry.count }.from(0).to(1)
      end
    end

    context "with invalid params" do
      let(:invalid_params) do
        { entry: { system_object_id: '', activity_id: 1 } }
      end

      it "renders :new" do
        post :create, invalid_params.merge({ cmdr_id: cmdr.id })
        expect(response).to render_template("new")
      end

      it "does not create a new entry" do
        expect {
          post :create, invalid_params.merge({ cmdr_id: cmdr.id })
        }.to_not change{ Entry.count }
      end
    end
  end

  describe "#update" do
    let!(:entry)       { create(:entry, cmdr: cmdr) }
    let(:valid_params) { { id: entry.id, entry: { is_closed: true }, cmdr_id: entry.cmdr_id } }

    context "with valid params" do
      it "changes the entry" do
        expect(entry.is_closed).to eq(false)
        put :update, valid_params
        entry.reload
        expect(entry.is_closed).to eq(true)
      end

      it "redirects to the cmdrs path" do
        put :update, valid_params
        expect(response).to redirect_to(cmdr_path(entry.cmdr))
      end
    end

  end
end
