class AddDefaultValueToColor < ActiveRecord::Migration[6.0]
  def up
    Label.where(color: nil).find_each { |u| u.update(color: '#005BAA') }

    change_column :labels, :color, :string, default: '#005BAA', null: false
  end

  def down
    change_column :labels, :color, :string, default: nil, null: true
  end
end
