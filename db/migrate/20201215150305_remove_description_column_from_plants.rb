class RemoveDescriptionColumnFromPlants < ActiveRecord::Migration[6.0]
  def change
    remove_column :plants, :description
  end
end
