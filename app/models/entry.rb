class Entry < ActiveRecord::Base
  belongs_to :user

  has_many :items, :dependent => :destroy

  default_scope :order => 'entries.entry_date DESC'


end
