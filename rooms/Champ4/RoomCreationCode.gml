if global.rand = 0{
global.mr = 253
global.mg = 181
global.mb = 118
global.mr2 = 15
global.mg2 = 124
global.mb2 = 71
global.dr = 255
global.dg = 253
global.db = 56
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
global.ex2 = 416
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
