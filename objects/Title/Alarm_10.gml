var __b__;
__b__ = action_if_variable(global.game, 0, 0);
if __b__
{
{
global.rand = irandom(1); if global.rand = 0{global.mode = irandom(4)}; global.plus = irandom(1);

if global.rand = 1{script_execute(maze_picker)};else{script_execute(mazer)}


}
}
__b__ = action_if_variable(global.game, 1, 0);
if __b__
{
{
__b__ = action_if_variable(show, 0, 0);
if __b__
{
{
show = 1;
action_set_alarm(360, 10);
exit;
}
}
else
{
{
global.rand = irandom(1); if global.rand = 0{global.mode = irandom(4)}; global.plus = irandom(1);

if global.rand = 1{script_execute(maze_picker)};else{script_execute(mazer)}


}
}
}
}
__b__ = action_if_variable(global.game, 2, 0);
if __b__
{
{
__b__ = action_if_variable(show, 0, 0);
if __b__
{
{
show = 1;
action_set_alarm(360, 10);
exit;
}
}
else
{
{
global.rand = irandom(1); if global.rand = 0{global.mode = irandom(4)}; global.plus = irandom(1);

if global.rand = 1{script_execute(maze_picker)};else{script_execute(mazer)}


}
}
}
}
