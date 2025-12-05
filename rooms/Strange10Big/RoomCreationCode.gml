with Wall{
    if x > 0 and x < 80{
        if y = 240{image_index = 4}
        if y = 256{image_index = 2}
        if y = 432{image_index = 4}
        if y = 448{image_index = 2}
    }
    if x > 352 and x < 432{
        if y = 240{image_index = 4}
        if y = 256{image_index = 2}
        if y = 432{image_index = 4}
        if y = 448{image_index = 2}
    }
}
if global.rand = 0{
global.mr = 0
global.mg = 0
global.mb = 255
global.mr2 = 0
global.mg2 = 0
global.mb2 = 0
global.dr = 255
global.dg = 183
global.db = 174
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
global.ex1 = 272
global.ex2 = 416
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
