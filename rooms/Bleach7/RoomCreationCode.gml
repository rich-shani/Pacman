if global.rand = 0{
global.mr = 255
global.mg = 255
global.mb = 0
global.mr2 = 64
global.mg2 = 64
global.mb2 = 64
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
global.p1x = 112
global.p1y = 144
global.p2x = 160
global.p2y = 416
global.p3x = 176
global.p3y = 256
global.last = 1
