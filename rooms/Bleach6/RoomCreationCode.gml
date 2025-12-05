if global.rand = 0{
global.mr = 128
global.mg = 255
global.mb = 128
global.mr2 = 255
global.mg2 = 200
global.mb2 = 100
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
global.p1x = 64
global.p1y = 128
global.p2x = 16
global.p2y = 352
global.p3x = 208
global.p3y = 240
