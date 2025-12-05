action_set_relative(1);
global.credit += 1;
action_sound(Credit, 0);
if ((global.p1lives = 0 and global.p2gameover = 1) or (global.p1gameover = 1 and global.p2lives = 0)) and global.lvl > 0 and countdown > -1{
countdown = 10; alarm[11] = 1;
}

var __b__;
__b__ = action_if_variable(global.lvl, 0, 0);
if __b__
{
{
{
action_set_relative(0);
global.game = 0;
action_set_relative(1);
}
{
action_set_relative(0);
global.plus = 0;
action_set_relative(1);
}
{
action_set_relative(0);
global.rand = 0;
action_set_relative(1);
}
{
action_set_relative(0);
global.mode = 0;
action_set_relative(1);
}
action_another_room(rm_Menu, 0);
}
}
action_set_relative(0);
