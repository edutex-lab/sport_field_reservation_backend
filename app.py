from appflask import app
from routes import configure_routes
from routes_auth_player import player_auth_configure_routes
from routes_device import device_configure_routes
from routes_auth_admin import admin_auth_configure_routes
from routes_field_management import field_management_configure_routes
from routes_auth_relogin import relogin_configure_routes
from routes_player_venue_info import player_venue_info_cofigure_routes
from routes_player_booking import player_booking_configure_routes
from routes_admin_booking_system import admin_booking_configure_routes
from routes_control_system import control_system_configure_routes
from routes_member_management import member_management_configure_routes
from routes_chat_player import chat_player_configure_routes
from routes_match_history import match_history_configure_routes
from routes_profile import profile_configure_routes

device_configure_routes(app)
configure_routes(app)
player_auth_configure_routes(app)
admin_auth_configure_routes(app)
field_management_configure_routes(app)
relogin_configure_routes(app)
player_venue_info_cofigure_routes(app)
player_booking_configure_routes(app)
admin_booking_configure_routes(app)
control_system_configure_routes(app)
member_management_configure_routes(app)
chat_player_configure_routes(app)
match_history_configure_routes(app)
profile_configure_routes(app)



if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
