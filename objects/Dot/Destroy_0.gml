if Pac.finish = 0{
Pac.dotcount = Pac.dotcount + 1;
}
tile_layer_delete_at(depth,x,y);
tile_layer_delete_at(depth+1,x,y);
tile_layer_delete_at(depth-1,x,y);

