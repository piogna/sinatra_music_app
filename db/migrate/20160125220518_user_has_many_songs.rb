class UserHasManySongs < ActiveRecord::Migration
  def change
    add_reference :tracks, :users, index: true
  end
end
