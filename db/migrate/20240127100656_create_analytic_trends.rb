class CreateAnalyticTrends < ActiveRecord::Migration[7.1]
  def change
    create_table :analytic_trends do |t|
      t.string :query
      t.integer :search_total

      t.timestamps
    end
  end
end
