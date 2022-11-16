
# Crack64Bit

Minecraft seed cracking the practice of finding an exact Minecraft world from data from that world. This particular program is a series two programs to spilt the task of finding the world seed. We start the progam with some GPU programing with [CUDA](https://developer.nvidia.com/cuda-toolkit) in the file **Crack64Bit_The_Beginning** runs a defined set of data to spilt the possible structure seeds (the bottom 48 bits of a Minecarft worldseed).  This is retutured as a text file as a data pool to be filtered in second program **Crack64Bit_The_Sequel** to return useable world seeds.  This program is written in Java makeing use of the [Minecraft Seed Libarys](https://kaptainwutax.seedfinding.com/) devloped by user [Kaptainwutax](https://github.com/KaptainWutax).  


# Project Use
To run this project you will need a few things:

**-Patience**
This is finding a seed though brute force not the most efficient method be preapred to leave your computer running for a few hours. 

**-[The Nvidia Cuda Toolkit](https://developer.nvidia.com/cuda-toolkit)**

A fundamental part of this program is the use of parrel programing to find structure seeds. This is done by parrel programing made possible by the Nvidia Cuda Toolkit. By extension this also means you are required to have a Nvidia GPU to run this program.  

**-[JavaJDK](https://www.oracle.com/java/technologies/javase/jdk16-archive-downloads.html)**

Required for the second program, double check the varribles you would need a varrible "JAVA_HOME" is set to your Java JDK installed and the "PATH" varrible is set to the bin folder in your Java JDK folder.

**-[Gradle](https://gradle.org/)**

Build tool for Java. Used to incorporate the seed finding libarys into the Java program.  When installing Gradle it is imporant to make sure it is a compadible verrsion to Java, seen on the sites documentation. And **Gradle_Home** is set as a system varrible with the path set to the folders locasion on your system and and the bin folder added to the **"PATH"** varrible.

**-[IntelliJ IDEA](https://www.jetbrains.com/idea/)**

This is an IDE to run Java code, allthough any programing environment _should_ work code is configured to work on this environment. 

When everything is installed you can run the first of this project by dowloading the zip file apart this Github respiratory. The two programs are combined because of their dependency on the other. The first stage of this project is found in the file **"Crack64Bit_The_Beginning"**. Use was desinged to be very simple drag the folder to your computers desktop and run the executeable file "GPU.exe" that does all the magic for you. You can see a screen recoding of this procsss [here](https://youtu.be/m_Qbvg5l4D8). 

After this proces you would recive a out.txt file. Compile this with the second program **"Crack64Bit_The_Sequel"**. You can do this by adding the file to your resources folder on IntelliJ IDEA. You can see a screen recoding of this procsss [here](https://youtu.be/vMJORczjRSk). 



## Acknowledgements

 - [Kaptainwutax Minecraft Seed Finding libraries](https://kaptainwutax.seedfinding.com/)
  
 - [hube12 (Neil)](https://github.com/hube12)

 - [Minecraft@home](https://minecraftathome.com/)
 
 - [CUDA](https://docs.nvidia.com/cuda/)

## Lessons Learned

What did you learn while building this project? What challenges did you face and how did you overcome them?


## Support

For support or qustions about technical Minecraft, email tg24006@pathwayshigh.org or contact Tatertot#7962 on discord.

