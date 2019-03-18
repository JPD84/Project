To run this you will need to have SQLPostgres and Sinatra installed. 

Have 3 Terminal windows open.

Window 1 - Navigate to the 'db' folder and type 'psql -d body_burner_gym -f members.sql'
Then type 'psql -d body_burner_gym'

Window 2 - Navigate to the 'db' folder and type 'ruby seeds.rb'

Window 3 - Navigate to the home folder 'body_burner_gym' and type 'ruby app.rb' This will then open up the app in the browser. IF not then then type into the browser 'localhost:4567'
