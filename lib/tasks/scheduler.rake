desc "This task is called by the Heroku scheduler add-on"
task :reminder => :environment do
  Problem.reminder
end