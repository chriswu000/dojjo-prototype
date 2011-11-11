class Entry < ActiveRecord::Base
  before_create :default_values

  belongs_to :user

  has_many :items, :dependent => :destroy

  default_scope :order => 'entries.entry_date DESC'


  private

    def default_values
      self.entry_date = Time.now
    end
end
