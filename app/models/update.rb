class Update < ActiveRecord::Base
  attr_accessible :title, :body, :project_id, :author_id
  
  belongs_to :project
  belongs_to :author, class_name: "User", foreign_key: :author_id
end
