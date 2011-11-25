class Item < ActiveRecord::Base
  attr_accessor_with_default :is_draft, false
  
  belongs_to :entry
  
  acts_as_taggable

  def is_draft?
    self.is_draft
  end

end
