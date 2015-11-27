class ChangeColumnType < ActiveRecord::Migration
    def up
      change_column :concerts, :description, :text
    end

    def down
      change_column :concerts, :description, :string
    end
end
