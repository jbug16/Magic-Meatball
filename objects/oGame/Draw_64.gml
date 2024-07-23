var _t = "";
if (global.closest_player == oPlayer) _t = "player";
else if (global.closest_player == oShadowPlayer) _t = "shadow";

draw_text(20, 20, _t);