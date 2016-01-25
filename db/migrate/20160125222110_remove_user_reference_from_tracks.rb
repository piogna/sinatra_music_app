class RemoveUserReferenceFromTracks < ActiveRecord::Migration
  def change
    remove_reference :tracks, :users, index: true
  end
end
