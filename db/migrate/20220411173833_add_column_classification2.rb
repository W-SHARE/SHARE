class AddColumnClassification2 < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :classification_2, :string
    rename_column :courses, :classification, :classification_1
  end
end
