/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

global.orders_completed = 0;

instance_activate_all();
surface_free(oGameOverUI.paused_surf);
oGameOverUI.paused_surf = -1;

room_goto(rmLevelSelect);