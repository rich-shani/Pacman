with Wall{
    if (y = 400 or y = 448) and (x = 96 or x = 336){image_index = 18};
    if (y = 416 or y = 464){if (x = 80 or x = 320){image_index = 19};if (x = 112 or x = 352){image_index = 17};}
    if (y = 432 or y = 480) and (x = 96 or x = 336){image_index = 20};
    if y = 464{if x = 176{image_index = 19}; if x = 256{image_index = 17};}
}
if global.rand = 0{
global.mr = 255
global.mg = 0
global.mb = 0
global.mr2 = 0
global.mg2 = 0
global.mb2 = 255
global.dr = 255
global.dg = 255
global.db = 255
global.ex1 = 0
global.ex2 = 0
}
else{
global.mr = irandom(255)
global.mg = irandom(255)
global.mb = irandom(255)
if global.game = 1{
global.mr2 = irandom(255)
global.mg2 = irandom(255)
global.mb2 = irandom(255)
}
else{
global.mr2 = 0
global.mg2 = 0
global.mb2 = 0
}
global.dr = irandom(255)
global.dg = irandom(255)
global.db = irandom(255)
if irandom(4) = 0{
global.dr = 255
global.dg = 255
global.db = 255
}
if global.game = 0{
global.ex1 = 0
global.ex2 = 0
}
if global.game = 1{
global.ex1 = 64
global.ex2 = 64
}
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
