action_set_relative(1);
global.credit += 1;
action_sound(Credit, 0);
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
action_another_room(rm_Menu);
action_set_relative(0);
