class Item < ActiveRecord::Base
  attr_accessor_with_default :is_draft, false

  def is_draft?
    self.is_draft
  end

  belongs_to :entry
end
