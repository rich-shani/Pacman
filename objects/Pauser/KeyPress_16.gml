action_set_relative(1);
var __b__;
__b__ = action_if_variable(pause, 1, 0);
if __b__
{
{
global.credit += 1;
action_sound(Credit, 0);
}
}
action_set_relative(0);
