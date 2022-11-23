import kaptainwutax.biomeutils.source.BiomeSource;
import kaptainwutax.featureutils.structure.Fortress;
import kaptainwutax.mcutils.block.Block;
import kaptainwutax.mcutils.block.Blocks;
import kaptainwutax.mcutils.rand.ChunkRand;
import kaptainwutax.mcutils.state.Dimension;
import kaptainwutax.mcutils.util.pos.BPos;
import kaptainwutax.mcutils.util.pos.CPos;
import kaptainwutax.mcutils.util.pos.RPos;
import kaptainwutax.mcutils.version.MCVersion;
import kaptainwutax.terrainutils.terrain.NetherTerrainGenerator;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;
import java.util.stream.Collectors;

//Defines main class where the magic happens 
public class Crack2{

	//Sets “VERSION” variable to minecraft 1.17 from the MC utils library 
	public static MCVersion VERSION = MCVersion.v1_17;
	//Defines “FORTRESS” as a nether fortress form 1.17 
	public static Fortress FORTRESS = new Fortress(VERSION);
//Makes a list of all the chunk positions of spots on a fortress 
//Always good to double check; more detailed slower search don’t want any false //positives 
	public static List<CPos> fortresses = new ArrayList<CPos>() {{
		add(new CPos(-9, 20));
		add(new CPos(-10, 20));
		add(new CPos(-11, 20));
		add(new CPos(-12, 20));
		add(new CPos(-6, 19));
		add(new CPos(-6, 18));
		add(new CPos(-6, 20));
		add(new CPos(-6, 21));
		add(new CPos(-8, 20));
add(new CPos(-5, 39));
add(new CPos(-5, 20));
add(new CPos(-6, 22	));
	}};

	//Reads input file 
	public static void main(String[] args) throws IOException {
		List<Long> seeds = readFile();
	
	//Prints “File read” in the terminal for user 
System.out.println("File read");
		long count = seeds.size();
	
		//Preps writer for final seed outputs 
	BufferedWriter writer = new BufferedWriter(new FileWriter("final.txt", false));
		seeds.stream().parallel().filter(s -> process(s, count))
				.filter(Crack2 ::processTerrain)
				.forEach(x -> {
					try {
						writer.write(x + "\n");
					} catch (IOException e) {
						e.printStackTrace();
					}
				})
		;
		writer.flush();
		writer.close();
	}


	public static AtomicLong atomicLong = new AtomicLong(0);
//Prints estimated competition percent out of 100
	public static boolean process(long seed, long max) {
		long current = atomicLong.getAndIncrement();
		if (current % (max / 100) == 0) {
			System.out.println((int) (((double) current) / (((double) max / 100.0))) + "%");
		}


		//New object ChunkRand form “ChunkRand
		ChunkRand rand = new ChunkRand();
//from our table of Chunk positions of fortresses 
for (CPos fortress : fortresses) {
// rPos(region position) relative to FORTRESS (a nether Fortress from MC 1.17) 
			RPos rPos = fortress.toRegionPos(FORTRESS.getSpacing());
	
CPos pos = FORTRESS.getInRegion(seed, rPos.getX(), rPos.getZ(), rand);
if (pos == null || !pos.equals(fortress)) {
  return false;
			}
		}
		return true;
	}

// Makes a list for terrain data in the form of block poisons 
	public static List<BPos> terrain = new ArrayList<>() {{
		add(new BPos(-196, 41, 233));
		add(new BPos(-197, 42, 233));
		add(new BPos(-199, 43, 233));
		add(new BPos(-198, 40, 220));
		add(new BPos(-200, 42, 222));
		add(new BPos(-201, 41, 222));
		add(new BPos(-201, 39, 221));
		add(new BPos(-201, 38, 220));
		add(new BPos(-202, 36, 218));
		add(new BPos(-204, 35, 216));
	}};


	public static boolean processTerrain(long seed) {
//New biome object, with the data from the dimension (Nether) and the Version (MC //1.17)   
//setting up for chunk Generator simulation for the height terrain map 
BiomeSource biomeSource = BiomeSource.of(Dimension.NETHER, VERSION, seed);
NetherTerrainGenerator netherChunkGenerator = (NetherTerrainGenerator)NetherTerrainGenerator.of(biomeSource);
	


//Height map testing, to generate the terrain map I am pulling the data of by block position from //the chunk we collected stored in variable terrain I am checking for that block, that going //vertical across the Y axis confirming the block above that is air, than the block above that is all //the way the the nether roof. 
	for (BPos pos : terrain) {
			Block[] column = netherChunkGenerator.getColumnAt(pos.getX(), pos.getZ());
			if (column[pos.getY()-1] != netherChunkGenerator.getDefaultBlock() || column[pos.getY() ] != Blocks.AIR) {
				return false;
			}
		}
		//print Seed 
		System.out.println(seed);
		return true;
	}

	public static List<Long> readFile() {
		//Reads and inputs the data from “Out.txt” (the stuff from part 1) 
InputStream in = Crack2 .class.getResourceAsStream("/out.txt");
			
		BufferedReader reader = new BufferedReader(new InputStreamReader(in));
		return reader.lines().parallel().map(x -> Long.parseLong(x, 16)).collect(Collectors.toList());
	}
}
