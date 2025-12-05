with Wall{
    if x = 112{
        if y = 256{image_index = 27;}
        if y = 288{image_index = 28;}
    }
    if x = 320{
        if y = 256{image_index = 26;}
        if y = 288{image_index = 25;}
    }
    if x = 112 and y = 272{image_index = 17}
    if x = 320 and y = 272{image_index = 19}
    if (x = 96 or x = 336) and y = 256{image_index = 4}
    if (x = 96 or x = 336) and y = 288{image_index = 2}
}
if global.rand = 0{
global.mr = 0
global.mg = 255
global.mb = 255
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
global.ex1 = 240
global.ex2 = 304
}
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0

