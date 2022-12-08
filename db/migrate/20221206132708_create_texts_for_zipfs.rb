class CreateTextsForZipfs < ActiveRecord::Migration[7.0]
  def change
    create_table :texts_for_zipfs do |t|
      t.string :text_name
      t.string :text_file

      t.timestamps
    end
  end
end
