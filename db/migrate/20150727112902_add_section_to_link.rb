class AddSectionToLink < ActiveRecord::Migration
  def change
    add_column :links, :section, :string
  end
end
