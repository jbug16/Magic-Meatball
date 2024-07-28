//room end
var json = json_stringify(global.room_highscores);
var json_size = string_byte_length(json);
var buffer = buffer_create(json_size, buffer_fixed, 1);
buffer_write(buffer, buffer_text, json);
buffer_save(buffer, "high_scores");
buffer_delete(buffer);