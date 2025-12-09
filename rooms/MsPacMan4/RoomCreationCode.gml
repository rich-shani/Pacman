if global.rand = 0{
if global.loop = 0{
global.mr = 255
global.mg = 183
global.mb = 81
global.dr = 222
global.dg = 222
global.db = 255
}
global.ex1 = 256

if global.loop = 1{
global.mr = 255
global.mg = 0
global.mb = 0
global.dr = 222
global.dg = 222
global.db = 255
}
}
else{
global.mr = irandom(255)
global.mg = irandom(255)
global.mb = irandom(255)
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
}
if global.game = 1{
global.ex1 = 256
}
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
