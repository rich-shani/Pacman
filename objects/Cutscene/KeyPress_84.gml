exit;
var __b__;
__b__ = action_if_variable(global.game, 0, 0);
if __b__
{
{
__b__ = action_if_variable(global.lvl, 2, 0);
if __b__
{
{
global.lvl = 5;
action_current_room(0);
exit;
}
}
__b__ = action_if_variable(global.lvl, 5, 0);
if __b__
{
{
global.lvl = 6;
action_current_room(0);
exit;
}
}
__b__ = action_if_variable(global.lvl, 5, 2);
if __b__
{
{
global.game = 1;
global.lvl = 2;
action_current_room(0);
exit;
}
}
}
}
__b__ = action_if_variable(global.game, 1, 0);
if __b__
{
{
__b__ = action_if_variable(global.lvl, 2, 0);
if __b__
{
{
global.lvl = 5;
action_current_room(0);
exit;
}
}
__b__ = action_if_variable(global.lvl, 5, 0);
if __b__
{
{
global.lvl = 6;
action_current_room(0);
exit;
}
}
__b__ = action_if_variable(global.lvl, 5, 2);
if __b__
{
{
global.game = 2;
global.lvl = 1;
action_current_room(0);
exit;
}
}
}
}
__b__ = action_if_variable(global.game, 2, 0);
if __b__
{
{
__b__ = action_if_variable(global.lvl, 1, 0);
if __b__
{
{
global.lvl = 3;
action_current_room(0);
exit;
}
}
__b__ = action_if_variable(global.lvl, 3, 0);
if __b__
{
{
global.lvl = 4;
action_current_room(0);
exit;
}
}
__b__ = action_if_variable(global.lvl, 3, 2);
if __b__
{
{
global.game = 0;
global.lvl = 2;
action_current_room(0);
exit;
}
}
}
}
