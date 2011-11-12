namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do 
    Rake::Task['db:reset'].invoke
    @users = []

    # create 1 users
    (1..1).each do |n|
      @users << User.create!(:email => "user#{n}@dojjo.com",
                             :password => "#{n}"*6)
    end

    # for each user, create 100 entries
    @users.each do |user|
      (1..20).each do |n|
        @date = Date.today.beginning_of_month + rand(30);
        user.entries.create!(:entry_date => @date)
      end
    end

    # for each entry, create 5 items
    @users.each do |user|
      user.entries.each do |entry|
        (1..5).each do |n|
          entry.items.create!(:content => (1 + rand(5)).sentences)
        end
      end
    end
  end
end
