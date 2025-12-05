if global.rand = 0{
global.mr = 64
global.mg = 255
global.mb = 128
global.mr2 = 0
global.mg2 = 255
global.mb2 = 255
global.dr = 255
global.dg = 255
global.db = 255
}
else{
global.mr = irandom(255)
global.mg = irandom(255)
global.mb = irandom(255)
global.mr2 = irandom(255)
global.mg2 = irandom(255)
global.mb2 = irandom(255)
global.dr = irandom(255)
global.dg = irandom(255)
global.db = irandom(255)
if irandom(4) = 0{
global.dr = 255
global.dg = 255
global.db = 255
}
}
global.ex1 = 0
global.ex2 = 0
global.p1x = 80
global.p1y = 112
global.p2x = 64
global.p2y = 448
global.p3x = 208
global.p3y = 288
