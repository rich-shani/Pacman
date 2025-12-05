with Wall{
    if x > 64 and x < 128{
        if y = 240{image_index=4}
        if y = 256{image_index=2}
    }
    if x > 304 and x < 368{
        if y = 240{image_index=4}
        if y = 256{image_index=2}
    }
    if y > 256 and y < 336{
        if x = 48{image_index=3}
        if x = 64{image_index=1}
        if x = 368{image_index=3}
        if x = 384{image_index=1}
    }
    if y > 367 and y < 385{
        if x = 48{image_index=3}
        if x = 64{image_index=1}
        if x = 368{image_index=3}
        if x = 384{image_index=1}
    }
    if x < 48{
        if y = 336{image_index=4}
        if y = 352{image_index=2}
    }
    if x > 384{
        if y = 336{image_index=4}
        if y = 352{image_index=2}
    }
}
if global.rand = 0{
global.mr = 255
global.mg = 255
global.mb = 255
global.mr2 = 90
global.mg2 = 0
global.mb2 = 123
global.dr = 255
global.dg = 255
global.db = 255
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
}
if global.game = 0{
global.ex1 = 0
global.ex2 = 0
}
if global.game = 1{
if irandom(1) = 1{global.ex1 = 176};else{global.ex1 = 320}
if irandom(1) = 1{global.ex2 = 368};else{global.ex2 = 320}
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
