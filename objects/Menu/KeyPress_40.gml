if set = 5{set = 0; sound_play(Bump)};else{
if set < 4{set = set + 1; sound_play(Bump)}else{if set = 4{if global.credit > 1{set = set + 1; sound_play(Bump)}else{set = 0; sound_play(Bump)}}}
}

