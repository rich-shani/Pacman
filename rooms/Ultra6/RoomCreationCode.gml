with Wall{
    if (x = 96 and y = 96) or (x = 272 and y = 96) or (x = 96 and y = 224) or (x = 320 and y = 224) or (x = 96 and y = 304) or (x = 320 and y = 304) or (x = 48 and y = 448) or (x = 368 and y = 448)
    {image_index = 25}
    if (x = 160 and y = 96) or (x = 336 and y = 96) or (x = 112 and y = 224) or (x = 336 and y = 224) or (x = 112 and y = 304) or (x = 336 and y = 304) or (x = 64 and y = 448) or (x = 384 and y = 448)
    {image_index = 28}
    if (x = 96 and y = 112) or (x = 272 and y = 112) or (x = 96 and y = 240) or (x = 320 and y = 240) or (x = 96 and y = 384) or (x = 320 and y = 384) or (x = 48 and y = 480) or (x = 368 and y = 480)
    {image_index = 26}
    if (x = 160 and y = 112) or (x = 336 and y = 112) or (x = 112 and y = 240) or (x = 336 and y = 240) or (x = 112 and y = 384) or (x = 336 and y = 384) or (x = 64 and y = 480) or (x = 384 and y = 480)
    {image_index = 27}
if y = 96 and ((x > 96 and x < 160) or (x > 272 and x < 336)){image_index = 18}
if y = 112 and ((x > 96 and x < 160) or (x > 272 and x < 336)){image_index = 20}
if y > 304 and y < 384 and (x = 96 or x = 320){image_index = 19}
if y > 304 and y < 384 and (x = 112 or x = 336){image_index = 17}
if y = 464 and (x = 48 or x = 368){image_index = 19}
if y = 464 and (x = 64 or x = 384){image_index = 17}
}
if global.rand = 0{
global.mr = 222
global.mg = 222
global.mb = 255
global.mr2 = 71
global.mg2 = 183
global.mb2 = 255
global.dr = 255
global.dg = 255
global.db = 0
global.ex1 = 0
global.ex2 = 0
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
global.ex1 = 192
global.ex2 = 336
}
}
global.p1x = 0
global.p1y = 0
global.p2x = 0
global.p2y = 0
global.p3x = 0
global.p3y = 0
