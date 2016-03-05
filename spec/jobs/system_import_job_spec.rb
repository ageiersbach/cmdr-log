require 'rails_helper'

describe SystemImportJob do
  describe ".perform" do
    let(:fake_systems) do
      [
        {"name" => "Princess Pony Landy", "x" => "0.02345", "y" => "-2.114", "z"=> "0.0"},
        {"name"=>"Centauri 7", "x"=> "0.00124", "y"=> "1.1115", "z"=> "-1.005" },
        {"name"=>"Beezlbub", "x"=> "2.22", "y"=> "-2.22", "z"=> "2.22" }
      ]
    end

    before do
      allow(Eddb).to receive(:systems).and_return(fake_systems)
    end

    subject(:run_job) { SystemImportJob.perform }

    it "verifies active connections" do
      expect(ActiveRecord::Base).to receive(:clear_active_connections!)
      run_job
    end

    it "gets the system data from eddb.io" do
      expect(Eddb).to receive(:systems)
      run_job
    end

    context "when the systems are new" do
      it { expect { run_job }.to change{ System.count }.from(0).to(3) }
    end

    context "when one or more already exists" do
      before { create(:system, name: "Centauri 7", x: 0.00124, y: 1.1115, z: -1.005) }

      it { expect { run_job }.to change{ System.count }.from(1).to(3) }
    end
  end
end

