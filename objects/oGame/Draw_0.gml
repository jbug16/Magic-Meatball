draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
if (room == rmMain) draw_text(20, 10, "Press \"R\" for recipes.");

draw_set_font(fntMenu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (room == rmBegin) draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "CLICK TO BEGIN");