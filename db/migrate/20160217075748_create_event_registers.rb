class CreateEventRegisters < ActiveRecord::Migration
  def change
    create_table :event_registers do |t|
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
