with Wall{
    if y = 32{
        if x = 224{image_index = 1}
        if x = 256{image_index = 3}
    }
    if y = 192{
        if x = 0{image_index = 8}
        if x = 16{image_index = 39}
        if x = 416{image_index = 36}
        if x = 432{image_index = 5}
    }
    if x = 0 or x = 432{
        if y = 256{image_index = 2}
        if y = 288{image_index = 4}
    }
    if y = 352{
        if x = 0{image_index = 7}
        if x = 16{image_index = 38}
        if x = 416{image_index = 37}
        if x = 432{image_index = 6}
    }
    if y = 528{
        if x = 112{image_index = 5}
        if x = 176 or x = 320{image_index = 8}
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
global.ex1 = 0
global.ex2 = 0
}
else{
with NoUp{instance_destroy()}
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
if irandom(1) = 1{global.ex1 = 128};else{global.ex1 = 272}
if irandom(1) = 1{global.ex2 = 464};else{global.ex2 = 272}
}
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
