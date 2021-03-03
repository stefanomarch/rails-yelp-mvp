class ChangeStarstoRating < ActiveRecord::Migration[6.1]
  def change
    rename_column :restaurants, :stars, :rating
  end
end
