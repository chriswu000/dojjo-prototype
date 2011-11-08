module EntriesHelper

  def entry_date(date)
    date.strftime("%b %d, %Y")
  end

end
