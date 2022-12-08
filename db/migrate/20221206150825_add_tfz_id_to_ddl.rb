class AddTfzIdToDdl < ActiveRecord::Migration[7.0]
  def change
    add_column :distribution_data_lovecrs, :tfz_id, :integer
    add_index :distribution_data_lovecrs, :tfz_id
  end
end
