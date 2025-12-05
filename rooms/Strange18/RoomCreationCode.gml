with Wall{
if y > 176 and y < 272{
    if x = 64{image_index=3}
    if x = 80{image_index=1}
    if x = 352{image_index=3}
    if x = 368{image_index=1}
}
if y > 304 and y < 352{
    if x = 64{image_index=3}
    if x = 80{image_index=1}
    if x = 352{image_index=3}
    if x = 368{image_index=1}
}
}
if global.rand = 0{
global.mr = 255
global.mg = 255
global.mb = 255
global.mr2 = 66
global.mg2 = 66
global.mb2 = 255
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
global.ex1 = 224
global.ex2 = 288
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
