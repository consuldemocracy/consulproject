class CreateInstallations < ActiveRecord::Migration[5.2]
  def change
    create_table :installations do |t|
      t.string :name
      t.string :repo
      t.timestamps
    end
  end
end
