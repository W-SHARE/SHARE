class AddAndDeleteColumnToReviewLabs < ActiveRecord::Migration[5.2]
  def change
    remove_column :review_labs, :core_time_start_hour, :integer
    remove_column :review_labs, :core_time_start_min, :integer
    remove_column :review_labs, :core_time_end_hour, :integer
    remove_column :review_labs, :core_time_end_min, :integer
    add_column :review_labs, :core_time_start, :string
    add_column :review_labs, :core_time_end, :string
  end
end
