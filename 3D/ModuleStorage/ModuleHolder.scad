$fa = 1;
$fs = 0.4;
inches = 25.4;
slot1_x = 0.1 * inches;
slot2_x = 2.6 * inches;
edge_slack = 1; // mm
slot_width = 0.0625*inches + edge_slack;
slot_length = 2.35*inches - slot1_x+edge_slack;
slot_height = 0.5 * inches;
wall_thickness = 0.0625*inches;
 difference() {
    cube([slot_width+wall_thickness, slot_length+wall_thickness, slot_height], center=true);
    cube([slot_width, slot_length, slot_height+1], center=true);
}