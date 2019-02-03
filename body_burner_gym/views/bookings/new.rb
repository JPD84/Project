<h1>Add new bookings</h1>
<form method="post"action="/bookings">
  <label for="member">Member:</label>
  <label for="gym_session">Gym_session:</label>
  <input type="text" member="member" id="member"/>

  <label for="member_id">Member_id:</label>
  <input type="member_id" type="member_id" id="member_id"/>


  <label for="gym_sessions">Gym_session:</label>
  <select name="gym_session_id" id="gym_session_id">
    <% Booking.all.each do |booking| %>
    <option value="<%= booking.id %>"><%= booking.name %></option>
    <% end %>
  </select>

  <input type="submit" value="Add booking"/>
</form>
