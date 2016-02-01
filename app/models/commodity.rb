class Commodity < ActiveRecord::Base
  validates :name, presence: true

  #TODO: Refactor this into its own model--could be an ActiveHash
  #      the scope below should be easier to improve as well
  enum category: [:chemicals, :consumer_items, :foods, :industrial_materials,
                  :legal_drugs, :machinery, :medicines, :metals, :minerals,
                  :salvage, :slavery, :technology, :textiles, :waste, :weapons]

  scope :mineable, -> { where(category: [7,8]) }
end
