with Wall{
    if x = 96 and y = 96{image_index = 11}
    if x = 336 and y = 96{image_index = 13}
    if x = 144 or x = 272{
        if y = 448{image_index = 25}
        if y = 464{image_index = 19}
        if y = 480{image_index = 26}
    }
    if x = 160 or x = 288{
        if y = 448{image_index = 28}
        if y = 464{image_index = 17}
        if y = 480{image_index = 27}
    }
}
if global.rand = 0{
global.mr = 255
global.mg = 0
global.mb = 0
global.mr2 = 255
global.mg2 = 183
global.mb2 = 174
global.dr = 222
global.dg = 222
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
global.ex1 = 256
global.ex2 = 256
}
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
