class AddProjectToChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :project, null: false, foreign_key: true
  end
end
