cycle = cycle + 1;
with Blinky{aboutface = 1}
with Pinky{aboutface = 1}
with Inky{aboutface = 1}
with Clyde{aboutface = 1}
if cycle = 1{alarm[1] = chase1*60; scatter = 0; exit}
if cycle = 2{if global.ex1 = 0 and room_width = 448{alarm[1] = scatter2*60; scatter = 1}; exit}
if cycle = 3{alarm[1] = chase2*60; scatter = 0; exit}
if cycle = 4{alarm[1] = scatter3*60; scatter = 1; exit}
if cycle = 5{alarm[1] = chase3*60; scatter = 0; exit}
if cycle = 6{alarm[1] = scatter4*60; scatter = 1; exit}
if cycle = 7{scatter = 0; exit}

