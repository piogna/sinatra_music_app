class AddUrlTextToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :url_text, :string
  end
end
