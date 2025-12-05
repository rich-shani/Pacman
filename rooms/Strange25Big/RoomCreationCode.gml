with Wall{
    if x > 0 and x < 80{
        if y = 192{image_index = 4}
        if y = 208{image_index = 2}
        if y = 528{image_index = 4}
        if y = 544{image_index = 2}
    }
    if x > 352 and x < 432{
        if y = 192{image_index = 4}
        if y = 208{image_index = 2}
        if y = 528{image_index = 4}
        if y = 544{image_index = 2}
    }
    
}
if global.rand = 0{
global.mr = 255
global.mg = 255
global.mb = 255
global.mr2 = 173
global.mg2 = 173
global.mb2 = 173
global.dr = 255
global.dg = 255
global.db = 0
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
global.ex1 = 64
global.ex2 = 512
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
