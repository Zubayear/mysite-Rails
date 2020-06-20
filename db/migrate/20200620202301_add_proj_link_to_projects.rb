class AddProjLinkToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :proj_link, :text
  end
end
