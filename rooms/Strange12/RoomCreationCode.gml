with Wall{if y > 496{
    if (x/16)&1 = true{
        if y = 512{image_index = 36}
        if y = 528{image_index = 5}
    }
    else{
        if y = 512{image_index = 39}
        if y = 528{image_index = 8}
    }
    if x=0{
        if y = 512{image_index = 1}
        if y = 528{image_index = 8}
    }
    if x=432{
        if y = 512{image_index = 3}
        if y = 528{image_index = 5}
    }
}}
if global.rand = 0{
global.mr = 255
global.mg = 255
global.mb = 255
global.mr2 = 181
global.mg2 = 33
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
global.ex1 = 208
global.ex2 = 256
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
