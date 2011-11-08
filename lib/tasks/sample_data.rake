namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do 
    Rake::Task['db:reset'].invoke
    @users = []

    # create 10 users
    (1..10).each do |n|
      @users << User.create!(:email => "user#{n}@dojjo.com",
                             :password => "#{n}"*6)
    end

    # for each user, create 10 entries
    @users.each do |user|
      (1..10).each do |n|
        user.entries.create!(:entry_date => Time.now)
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
