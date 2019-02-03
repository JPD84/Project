<h1>All Bookings</h1>

<% @booking.each do |bookings| %>
  <p>member_id: <%= member.id %></p>
  <p>gym_session_id: <%= gym_session.id %></p>
  <p><a href="/bookings/<%= bookings.id %>">Show Bookings</a></p>
  <hr />

<% end %>
