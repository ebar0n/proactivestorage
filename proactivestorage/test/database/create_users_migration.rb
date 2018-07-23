# frozen_string_literal: true

class ProActiveStorageCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
    end
  end
end
