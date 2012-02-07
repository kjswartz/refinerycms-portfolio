module Refinery
  module Portfolio
    class Gallery < Refinery::Core::Base
      
      VALID_GALLERY_TYPES = %w(image video)

      acts_as_indexed :fields => [:title, :body]
      validates :title, :presence => true, :uniqueness => true
      validates :gallery_type, :presence => true, :inclusion => { :in  => VALID_GALLERY_TYPES }
      attr_accessible :title, :body, :parent_id, :lft, :rgt, :position, :gallery_type, :depth

      alias_attribute :description, :body

      acts_as_nested_set :dependent => :destroy

    end
  end
end