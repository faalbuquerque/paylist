class CreateListSets < ActiveRecord::Migration[6.1]
  def change
    create_table :list_sets do |t|
      t.string :name

      t.timestamps
    end
  end
end
