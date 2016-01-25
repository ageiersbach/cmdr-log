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

  end
end
