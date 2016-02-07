require 'rails_helper'

describe BasicEntryPresenter do
 let!(:entry) { create(:entry, activity: Activity.find(2)) }
 subject(:presenter) { BasicEntryPresenter.new(entry) }
end
