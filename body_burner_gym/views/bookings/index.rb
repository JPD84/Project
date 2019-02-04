<h1>All Bookings</h1>

<% @bookings.each do |booking| %>
  <p>Name: <%= gym_session.name %></p>
  <p>Type: <%= gym_session.type %></p>
  <p><a href="/gym_sessions/<%= gym_session.id %>">Show Gym Sessions</a></p>
  <hr />

<% end %>
