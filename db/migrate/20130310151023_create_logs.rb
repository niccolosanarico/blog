class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :type
      t.string :desc

      t.timestamps
    end
  end
end
