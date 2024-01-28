class CreateSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :searches do |t|
      t.string :query
      t.string :ip_address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
