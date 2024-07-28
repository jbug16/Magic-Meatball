randomize();

// Macros
#macro s show_debug_message

// Globals
global.orders_completed = 0;
global.current_timer = 0;

global.room_highscores = {};

if (file_exists("high_scores") == true) {
  var file = buffer_load("high_scores");
  var json = buffer_read(file, buffer_text);
  global.room_highscores = json_parse(json);
  buffer_delete(file);
}