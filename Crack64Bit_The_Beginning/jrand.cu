//Includes the program below 
#include <jrand.c>

// Function “ Random get_random_with_structure_seed” 
//Requires the potential world seed, an X value and a Z value and a generation chunk seed and
//salt 
static inline Random get_random_with_structure_seed (long world_seed, int x, int z, int salt) 

//Do not get confused by the big scary numbers 
//We are just multiplying the X and Z by a big scary number (addressed in SEED RNG)  than      // the adding world seed and salt to this value. 
{  return get_random(x * 341873128712L + z * 132897987541L + world_seed + salt);}

// Minecraft fortress function 
static inline int fortress_at(long world_seed, int x, int z) {
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
// kernel function 
__kernel void start(ulong offset, ulong stride, __global ulong *seeds, __global ushort *ret) {
  size_t id = get_global_id(0);
  uchar max_count = 0;
  uchar max_last = 0;
  ulong seed_base = (offset + id) * stride;
  for (ulong i = 0; i < stride; i++) {
    ulong worldSeed = seed_base|i;

      //fortress data if cPos cords continue 
   if (!fortress(worldSeed,-9, 20))continue; 
   if (!fortress(worldSeed,-10, 20))continue; 
   if (!fortress(worldSeed,-11, 20))continue; 
    if (!fortress (worldSeed,-12, 20))continue; 
    if (!fortress(worldSeed,-6, 19))continue; 
    if (!fortress(worldSeed,-6, 18))continue;
    if (!fortress(worldSeed,-6, 20))continue; 
   if (!fortress(worldSeed,-6, 21))continue; 
    if (!fortress(worldSeed,-8, 20))continue; 
    if (!fortress (worldSeed,-5, 39))continue; 
    if (!fortress(worldSeed,-5, 20))continue; 
    if (!fortress(worldSeed,-6, 22))continue; 
  
// 
 max_count++;
    seeds[id] = worldSeed;
  }
  ret[id] = (max_count << 8) | max_last;
}
