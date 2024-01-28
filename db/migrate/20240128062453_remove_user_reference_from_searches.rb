class RemoveUserReferenceFromSearches < ActiveRecord::Migration[7.1]
  def change
    remove_reference :searches, :user, null: false, foreign_key: true
  end
end
