class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :reportee_id

      t.timestamps
    end
  end
end
