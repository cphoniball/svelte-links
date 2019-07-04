class CreateLinkPages < ActiveRecord::Migration[5.2]
  def change
    create_table :link_pages do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end

    add_foreign_key :link_pages, :users
  end
end
