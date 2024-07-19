// Interaction
popup_radius = 100;
interaction_object = instance_create_layer(x, y - 64, "InteractionButton", oInteraction);
interaction_object.visible = false;

// Pickup
target = noone;
is_being_carried = false;