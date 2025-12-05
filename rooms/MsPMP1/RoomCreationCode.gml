with Wall{
if x = 32 and y = 512{image_index = 8}
if x = 64 and y = 528{image_index = 8}
if x = 176 and y = 48{image_index = 7}
if x = 256 and y = 48{image_index = 6}
if x = 368 and y = 528{image_index = 5}
if x = 400 and y = 512{image_index = 5}

if x = 32 and y = 496{image_index = 39}
if x = 64 and y = 512{image_index = 39}
if x = 176 and y = 64{image_index = 38}
if x = 256 and y = 64{image_index = 37}
if x = 368 and y = 512{image_index = 36}
if x = 400 and y = 496{image_index = 36}
}
if global.rand = 0{
global.mr = 255
global.mg = 0
global.mb = 0
global.mr2 = 255
global.mg2 = 183
global.mb2 = 174
global.dr = 222
global.dg = 222
global.db = 255
global.ex1 = 288
global.ex2 = 288
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
if irandom(4) = 0{
global.dr = 255
global.dg = 255
global.db = 255
}
if global.game = 0{
global.ex1 = 0
global.ex2 = 0
}
if global.game = 1{
global.ex1 = 288
global.ex2 = 288
}
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0

