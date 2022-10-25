#include <jrand.cl>

// Function “ Random get_random_with_structure_seed”  
//Requires the world seed found in ADD HERE , an X value and a Z value and a  generation //salt (see world Gen documentation) 
static inline Random get_random_with_structure_seed (long world_seed, int x, int z, int salt) 

//Do not get confused by the big scary numbers 
 
{    return get_random(x * 341873128712L + z * 132897987541L + world_seed + salt);}

// Function fortress_at ADD HERE
static inline int fortress_at(ulong world_seed, int x, int z) {
 //Region size of 27 
   int rSize = 27;
   //separation distance of 4 
 int rSep = 4;
    int constrained_x = x < 0 ? x - rSize + 1 : x;
    int constrained_z = z < 0 ? z - rSize + 1 : z;
    int rx = constrained_x / rSize;
    int rz = constrained_z / rSize;
    Random r = get_random_with_structure_seed(world_seed, rx, rz, 30084232);
    if (random_next_int(&r, rSize - rSep) != x - rx * rSize) return 0;
    if (random_next_int(&r, rSize - rSep) != z - rz * rSize) return 0;
    if (random_next_int(&r,5) >= 2) return 0;
    return 1;
}
//starts the CUDA kernel
__kernel void start(ulong offset, ulong stride, __global ulong *seeds, __global ushort *ret) {
    size_t id = get_global_id(0);
    uchar max_count = 0;
    uchar max_last = 0;
    ulong seed_base = (offset + id) * stride;
    for (ulong i = 0; i < stride; i++) {
        ulong worldSeed = seed_base|i;


 
        //fortress data if  cPos cords continue 
       if (!fortress(worldSeed,-9, 20))continue; 
        //fortress data if  cPos cords continue 
      if (!fortress(worldSeed,-10, 20))continue; 
        //fortress data if  cPos cords continue 
       if (!fortress(worldSeed,-11, 20))continue; 
         //fortress data if  cPos cords continue 
        if (!fortress (worldSeed,-12, 20))continue; 
         //fortress data if  cPos cords continue 
        if (!fortress(worldSeed,-6, 19))continue; 
         //fortress data if  cPos cords continue 
        if (!fortress(worldSeed,-6, 18))continue;
      //fortress data if  cPos cords continue 
       if (!fortress(worldSeed,-6, 20))continue; 
        //fortress data if  cPos cords continue 
      if (!fortress(worldSeed,-6, 21))continue; 
        //fortress data if  cPos cords continue 
       if (!fortress(worldSeed,-8, 20))continue; 
         //fortress data if  cPos cords continue 
        if (!fortress (worldSeed,-5, 39))continue; 
         //fortress data if  cPos cords continue 
        if (!fortress(worldSeed,-5, 20))continue; 
         //fortress data if  cPos cords continue 
        if (!fortress(worldSeed,-6, 22))continue; 
    
//  
  max_count++;
        seeds[id] = worldSeed;
    }
    ret[id] = (max_count << 8) | max_last;
}






