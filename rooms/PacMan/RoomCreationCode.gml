if global.rand = 0{

if global.mode = 0{

global.mr = 0

global.mg = 0

global.mb = 255

global.mr2 = 0

global.mg2 = 0

global.mb2 = 0

global.dr = 255

global.dg = 183

global.db = 174

global.ex1 = 0

global.ex2 = 0

}

if global.mode = 3{

global.mr = 255

global.mg = 183

global.mb = 174

global.mr2 = 0

global.mg2 = 0

global.mb2 = 0

global.dr = 255

global.dg = 255

global.db = 255

global.ex1 = 0

global.ex2 = 0

}

if global.mode = 4{

global.mr = 0

global.mg = 0

global.mb = 255

global.mr2 = 53

global.mg2 = 181

global.mb2 = 246

global.dr = 240

global.dg = 167

global.db = 0

global.ex1 = 0

global.ex2 = 0

}

}

else{

with NoUp{instance_destroy()}

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

global.ex1 = 272

global.ex2 = 272

}

}

if global.mode = 4{with NoUp{instance_destroy()}};

global.p1x = 0

global.p1y = 0

global.p2x = 0

global.p2y = 0

global.p3x = 0

global.p3y = 0

