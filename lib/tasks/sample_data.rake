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
    @tag_list = ["Practice", "Tournament", "Seminar", "Great", "Bad", "OK"]
    @users.each do |user|
      (1..20).each do |n|
        @date = Date.today.beginning_of_month + rand(30);
        user.entries.create!(:entry_date => @date,
                             :tag_list => @tag_list.sort_by{ rand }.slice(0..rand(@tag_list.length)))
      end
    end

    # for each entry, create 5 items
    @tag_list = ["arm bar", "throw", "partner", "to do next", "drill", "mount", "guard", "sweep", "back mount"]
    @users.each do |user|
      user.entries.each do |entry|
        (1..5).each do |n|
          entry.items.create!(:content => (1 + rand(5)).sentences, 
                              :tag_list => @tag_list.sort_by{ rand }.slice(0..rand(@tag_list.length)))
        end
      end
    end
  end
end
