class CreateDistributionDataLovecrs < ActiveRecord::Migration[7.0]
  def change
    create_table :distribution_data_lovecrs do |t|
      t.string :words
      t.integer :frequency
      t.float :ratio

      t.timestamps
    end
  end
end
