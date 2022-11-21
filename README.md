
# Crack64Bit

Minecraft Seed Cracking is the practice of finding an exact Minecraft world from data from that world. This particular program is a series of two programs to spilt the task of finding the world seed. We start the program with some GPU programming with [CUDA](https://developer.nvidia.com/cuda-toolkit) in the file **Crack64Bit_The_Beginning** runs a defined set of data to spilt the possible structure seeds (the bottom 48 bits of a Minecraft world seed). This is returned as a text file as a data pool to be filtered in the second program **Crack64Bit_The_Sequel** to return functional world seeds. This program is written in Java making use of the [Minecraft Seed Libarys](https://kaptainwutax.seedfinding.com/) developed by user [Kaptainwutax](https://github.com/KaptainWutax).  

For full written documentation and details related to Minecraft Seed Cracking, view [here](https://docs.google.com/document/d/1S-tqtsDtqdalQDEEsopy5CnU4O1-bL9xtSGgOIrrxzI/edit#). 

# Project Use
To run this project you will need a few things:

**-Patience**
This is finding a seed though brute force is not the most efficient method be prepared to leave your computer running for a few hours. 

**-[The Nvidia Cuda Toolkit](https://developer.nvidia.com/cuda-toolkit)**

A fundamental part of this program is the use of parrel programming to find structure seeds. This is done by parrel programming made possible by the Nvidia Cuda Toolkit. By extension, this also means you are required to have an Nvidia GPU to run this program.  

**-[JavaJDK](https://www.oracle.com/java/technologies/javase/jdk16-archive-downloads.html)**

Required for the second program, double check the variables you would need a variable "JAVA_HOME" is set to your Java JDK installed, and the "PATH" variable is set to the bin folder in your Java JDK folder.

**-[Gradle](https://gradle.org/)**

Build tool for Java. Used to incorporate the seed-finding libraries into the Java program.  When installing Gradle it is important to make sure it is a compatible version of the Java release you have on your system (seen on the site's documentation). And **Gradle_Home** is set as a system variable with the path set to the folder's location on your system the bin folder added to the **"PATH"** variable.

**-[IntelliJ IDEA](https://www.jetbrains.com/idea/)**

This is an IDE to run Java code, although any programming environment _should_ work code is configured to work on this environment. 

When everything is installed you can run the first of this project by downloading the zip file apart from this GitHub respiratory. The two programs are combined because of their dependency on the other. The first stage of this project is found in the file **"Crack64Bit_The_Beginning"**. Use was designed to be very simple drag the folder to your computer's desktop and run the executable file "GPU.exe" that does all the magic for you. You can see a screen recording of this process [here](https://youtu.be/m_Qbvg5l4D8). 

After this process, you would receive an out.txt file. Compile this with the second program **"Crack64Bit_The_Sequel"**. You can do this by adding the file to your resources folder on IntelliJ IDEA. You can see a screen recording of these processes [here](https://youtu.be/vMJORczjRSk). 

This program is intentionally designed to be accessible in how it was uploaded. Changing the program to filter for a different set of data follows that model. Starting with the first program the important files to edit would be the kernel. Without major exterior editing of the program, the only thing you would need to change is the defined fortresses. 

```bash
  if (!fortress(worldSeed,-9, 20))continue; 
  if (!fortress(worldSeed,-10, 20))continue; 
  if (!fortress(worldSeed,-11, 20))continue; 
  if (!fortress(worldSeed,-12, 20))continue; 
  if (!fortress(worldSeed,-6, 19))continue; 
  if (!fortress(worldSeed,-6, 18))continue;
  if (!fortress(worldSeed,-6, 20))continue; 
  if (!fortress(worldSeed,-6, 21))continue; 
  if (!fortress(worldSeed,-8, 20))continue; 
  if (!fortress(worldSeed,-5, 39))continue; 
  if (!fortress(worldSeed,-5, 20))continue; 
  if (!fortress(worldSeed,-6, 22))continue; 
 
```
Currently, this program is a list of Minecraft nether fortress chunk positions in our desired world. It is important to have multiple data points to filter the output results so the second program is not overwhelmed. Very simple to replace the data points with relevant chunk positions, which would be the coordinates dived by 16.  If you wish to search for another structure this is NOT the program for you because all the math is in terms of a Nether fortress from version 1.17. If you wish to do so the [salts](https://en.wikipedia.org/wiki/Salt_(cryptography)) from previous to do so are listed below.  


Two things need to be changed in the Java program for finding your seeds. First, the list of chunk positions relating to your fortress should be the same as the first program. 

```bash
add(new CPos(-9, 20));
add(new CPos(-10, 20));
add(new CPos(-11, 20));
add(new CPos(-12, 20));
add(new CPos(-6, 19));
add(new CPos(-6, 18));
add(new CPos(-6, 20));
add(new CPos(-6, 21));
add(new CPos(-8, 20));
```


As well as the list of block positions to gather terrain data. All that you have to do here is replace the values with various coordinates in random spots in a Minecraft chunk. The selected chunk has to be an open spot with no noticeable bits of land reaching over/ covering it. As well as the inclusion of some terrain at various Y, heights.    

```bash
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
	
```


## References

- **[Salts](https://drive.google.com/drive/folders/1ZFra3pnPNAz_CGeRdZTc0GMPA3yOqPA8)** courtesy of [Neil](https://github.com/hube12)

- [Kaptainwutax Minecraft Seed Finding libraries](https://kaptainwutax.seedfinding.com/)
  
- [hube12 (Neil)](https://github.com/hube12)

- [Minecraft@home](https://minecraftathome.com/)
 
- [CUDA](https://docs.nvidia.com/cuda/)


## Support

For support or questions about technical Minecraft, email tg24006@pathwayshigh.org or contact Tatertot#7962 on discord.
