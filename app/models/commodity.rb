class Commodity < ActiveRecord::Base
  validates :name, presence: true
  enum category: [:chemicals, :consumer_items, :foods, :industrial_materials, 
                  :legal_drugs, :machinery, :medicines, :metals, :minerals, 
                  :salvage, :slavery, :technology, :textiles, :waste, :weapons]

  scope :mineable, -> { where(category: [7,8]) } #TODO: there should be a better way to do this
end
