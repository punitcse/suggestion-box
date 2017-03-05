class SetDefaultValueForRatingScale < ActiveRecord::Migration[5.0]
  def change
    change_column_default :topics, :rating_scale, 10
  end
end
