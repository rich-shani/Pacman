if global.rand = 0{
global.mr = 252
global.mg = 40
global.mb = 252
global.mr2 = 124
global.mg2 = 14
global.mb2 = 123
global.dr = 41
global.dg = 253
global.db = 47
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
if irandom(1) = 0{global.ex1 = 64}else{global.ex1 = 112}
if irandom(1) = 0{global.ex2 = 192}else{global.ex2 = 512}
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
