class Photo < ActiveRecord::Base
	belongs_to :place

	mount_uploader :picture, PictureUploader

	validates :picture, :presence => true, :length => { :minimum => 3}
	
end
