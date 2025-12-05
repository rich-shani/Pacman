if global.rand = 0{
global.mr = 255
global.mg = 255
global.mb = 255
global.mr2 = 255
global.mg2 = 255
global.mb2 = 0
global.dr = 90
global.dg = 231
global.db = 49
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
if irandom(1)=1{global.ex1 = 256}else{global.ex1 = 304}
if irandom(1)=1{global.ex2 = 608}else{global.ex2 = 304}
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
