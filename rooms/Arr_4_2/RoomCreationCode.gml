if global.mode = 4{
global.mr = 115
global.mg = 52
global.mb = 0
global.mr2 = 192
global.mg2 = 134
global.mb2 = 11
global.dr = 100
global.dg = 240
global.db = 100
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
if irandom(1) = 0{global.ex1 = 272}else{global.ex1 = 64}
if irandom(1) = 0{global.ex2 = 272}else{global.ex2 = 512}
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
