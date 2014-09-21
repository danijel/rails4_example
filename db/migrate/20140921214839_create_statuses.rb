class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.references :user, index: { name: 'index_statuses_on_user_id' }
      t.string :status
      t.timestamps
    end
  end
end
