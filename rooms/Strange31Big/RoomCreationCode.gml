with Wall{
    if x > 160 and x < 272{
        if y = 80{ 
            if (x/16)&1 = true{image_index=39}
            else{image_index=36}
        }
        if y = 96{
            if (x/16)&1 = true{image_index=8}
            else{image_index=5}
        }
    }
    if x < 80{
        if y = 80{ 
            if (x/16)&1 = true{image_index=39}
            else{image_index=36}
        }
        if y = 96{
            if (x/16)&1 = true{image_index=8}
            else{image_index=5}
        }
        if y = 112{
            if x>0{image_index=2}
        }
    }
    if x > 352{
        if y = 80{ 
            if (x/16)&1 = true{image_index=39}
            else{image_index=36}
        }
        if y = 96{
            if (x/16)&1 = true{image_index=8}
            else{image_index=5}
        }
        if y = 112{
            if x<432{image_index=2}
        }
    }
}
if global.rand = 0{
global.mr = 0
global.mg = 0
global.mb = 255
global.mr2 = 255
global.mg2 = 0
global.mb2 = 0
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
global.ex1 = 64
global.ex2 = 368
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
