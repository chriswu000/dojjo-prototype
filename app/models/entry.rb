class Entry < ActiveRecord::Base
  belongs_to :user

  acts_as_taggable

  has_many :items, :dependent => :destroy

  default_scope :order => 'entries.entry_date DESC'


end
