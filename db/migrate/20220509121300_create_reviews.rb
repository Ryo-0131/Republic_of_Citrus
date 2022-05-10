class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text        :comment    , null: false
      t.integer     :all_rating , null: false
      t.integer     :rating1    , null: false
      t.integer     :rating2    , null: false
      t.integer     :rating3    , null: false
      t.integer     :rating4    , null: false
      t.references  :user       , null: false, foreign_key: true
      t.references  :item       , null: false, foreign_key: true
      t.timestamps
    end
  end
end