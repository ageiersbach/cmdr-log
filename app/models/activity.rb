class Activity < ActiveHash::Base
  self.data = [
    { id: 1, name: "Mine", presenter: MiningEntryPresenter, template: '/shared/mining_entry' },
    { id: 2, name: "Basic", presenter: BasicEntryPresenter, template: '/shared/basic_entry' }
  ]
end
