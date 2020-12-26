class CreateSwimLanes < ActiveRecord::Migration[6.0]
    def change
        create_table :swim_lanes do |t|
            t.string :name
            t.references :board, null: false, foreign_key: true
            t.references :user, null: false, foreign_key: true

            t.timestamps
        end
    end
end
