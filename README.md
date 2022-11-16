
# Crack64Bit

Minecraft seed cracking the practice of finding an exact Minecraft world from data from that world. This particular program is a series two programs to spilt the task of finding the world seed. We start the progam with some GPU programing with [CUDA](https://developer.nvidia.com/cuda-toolkit) in the file **Crack64Bit_The_Beginning** runs a defined set of data to spilt the possible structure seeds (the bottom 48 bits of a Minecarft worldseed).  This is retutured as a text file as a data pool to be filtered in second program **Crack64Bit_The_Sequel** to return useable world seeds.  This program is written in Java makeing use of the [Minecraft Seed Libarys](https://kaptainwutax.seedfinding.com/) devloped by user [Kaptainwutax](https://github.com/KaptainWutax).  


## Docmentation
To run this project you will need a few things:

**-Patience**
This is finding a seed though brute force not the most efficient method be preapred to leave your computer running for a few hours. 

**-[The Nvidia Cuda Toolkit](https://developer.nvidia.com/cuda-toolkit)**
A fundamental part of this program is the use of parrel programing to find structure seeds. This is done by parrel programing made possible by the Nvidia Cuda Toolkit. By extension this also means you are required to have a Nvidia GPU to run this program.  

**-[JavaJDK](https://www.oracle.com/java/technologies/javase/jdk16-archive-downloads.html)**

**-[Gradle](https://gradle.org/)**

Build tool for Java. Used to incorporate the seed finding libarys into the Java program.  When installing Gradle it is imporant to make sure it is a compadible verrsion to Java, seen on the sites documentation. And **Gradle_Home** is set as a system varrible with the path set to the folders locasion on your system and and the bin folder added to the **"PATH"** varrible.

**-[IntelliJ IDEA](https://www.jetbrains.com/idea/)**

This is an IDE to run Java code, allthough any programing environment _should_ work code is configured to work on this environment. 



#Project Use
To run the first stage of this project download the zip file. 
Superate  the file "Crack64Bit_The_Beginning" from the group I would suggest to drag it onto you desktop. 
The executeable file "GPU.exe" does all the magic for you, click that and watch your power bill rise. 
You can see a screen recoding of this procsss [here](https://youtu.be/m_Qbvg5l4D8). 


After this proces you would recive a out.txt file.  Compile this with the second program "Crack64Bit_The_Sequel" 




## Acknowledgements

 - [Kaptainwutax Minecraft Seed Finding libraries](https://kaptainwutax.seedfinding.com/)
  
 - [hube12 (Neil)](https://github.com/hube12)

 - [Minecraft@home](https://minecraftathome.com/)
 
 - [CUDA] (https://docs.nvidia.com/cuda/)

## Lessons Learned

What did you learn while building this project? What challenges did you face and how did you overcome them?


## Support

For support or qustions about technical Minecraft, email tg24006@pathwayshigh.org or contact Tatertot#7962 on discord.

