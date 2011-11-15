class Entry < ActiveRecord::Base
  belongs_to :user

  acts_as_taggable

  has_many :items, :dependent => :destroy

  default_scope :order => 'entries.entry_date DESC'

  named_scope :filter_date, lambda { | filter_date = Date.today | { :conditions => ["DATE(entry_date) = ?", filter_date] } }


end
