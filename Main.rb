require './EpicAuth.rb'

EpicAuth.new.Api(
    "", # Application Name
    "", # Application OwnerID
    "", # Application Secret
    "1.0" # Applicaiton Version
)

EpicAuth.new.ClearConsole
puts "\n\n Connecting.."
EpicAuth.new.Init

puts "\n App data:"
puts " Number of users: " + EpicAuth::AppInfo["numUsers"]
puts " Number of online users: " + EpicAuth::AppInfo["numOnlineUsers"]
puts " Number of keys: " + EpicAuth::AppInfo["numKeys"]
puts " Application Version: " + EpicAuth::Version
puts " Customer panel link: " + EpicAuth::AppInfo["customerPanelLink"]

puts "\n [1] Login\n [2] Register\n [3] Upgrade\n [4] License key only\n\n Choose option: "

Option = gets.chomp
case Option

when '1'
  puts "\n\n Enter username: "
  username = gets.chomp
  puts "\n\n Enter password: "
  password = gets.chomp
  EpicAuth.new.Login(username, password)

when '2'
  puts "\n\n Enter username: "
  username = gets.chomp
  puts "\n\n Enter password: "
  password = gets.chomp
  puts "\n\n Enter license: "
  key = gets.chomp
  EpicAuth.new.Register(username, password, key)

when '3'
  puts "\n\n Enter username: "
  username = gets.chomp
  puts "\n\n Enter license: "
  key = gets.chomp

  EpicAuth.new.Upgrade(username, key)

when '4'
    puts "\n\n Enter license: "
    key = gets.chomp
    EpicAuth.new.License(key)
else 
    puts "Invalid option"
    exit(0)
end

puts "\n Logged In!"
    
#user data
puts "\n User data:"
puts " Username: " + EpicAuth::User_data["username"]
puts " IP address: " + EpicAuth::User_data["ip"]
puts " Hardware-Id: " + EpicAuth::User_data["hwid"]
puts " Created at: " + EpicAuth.new.UnixToDate(EpicAuth::User_data["createdate"])
#puts " Last login: " + EpicAuth.new.UnixToDate(EpicAuth::User_data["lastlogin"])

puts " Your subscription(s):"
for i in EpicAuth::User_data["subscriptions"]
    puts " Subscription name: #{i["subscription"]} - Expires at: #{EpicAuth.new.UnixToDate(i["expiry"])}  - Time left in seconds: #{i["timeleft"]}"
end

puts "\n\n Exiting in 10 secs...."
sleep(10)
exit(0)
