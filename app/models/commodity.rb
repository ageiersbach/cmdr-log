class Commodity < ActiveRecord::Base
  validates :name, presence: true
  enum category: [:chemicals, :consumer_items, :foods, :industrial_materials, 
                  :legal_drugs, :machinery, :medicines, :metals, :minerals, 
                  :salvage, :slavery, :technology, :textiles, :waste, :weapons]
end
