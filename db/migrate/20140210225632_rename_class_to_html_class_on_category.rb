class RenameClassToHtmlClassOnCategory < ActiveRecord::Migration
  def change
    rename_column :categories, :class, :html_class
  end
end
