class CreateUpvotesTable < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.references :track
      t.references :user
      t.timestamps
    end
  end
end
