class Project < ActiveRecord::Base
  attr_accessible :description, :picture, :title, :url, :image

  mount_uploader :image, ImageUploader

  validates_presence_of :title

end

