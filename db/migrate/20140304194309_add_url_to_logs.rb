class AddUrlToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :url, :string
  end
end
