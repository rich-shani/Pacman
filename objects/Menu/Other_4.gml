if global.credit = 1 and global.players > 0{global.players = 0};

var __b__;
__b__ = action_if_variable(global.credit, 0, 0);
if __b__
{
action_another_room(rm_Title, 0);
}
