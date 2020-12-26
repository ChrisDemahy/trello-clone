class CreateBoardUsers < ActiveRecord::Migration[6.0]
    def change
        create_table :board_users do |t|
            t.references :board, null: false, foreign_key: true
            t.references :user, null: false, foreign_key: true

            t.timestamps
        end
    end
end
