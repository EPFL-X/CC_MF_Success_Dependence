# CC_MF_Success_Dependence
I tried dependency of jobs

Must add the following before sbatch the slurm file
$ mkdir /scratch/zhang2/ServiceHost
(Generally use the next three lines is fine. as the fold already exists)
$ cd /home/zhang2/.MathWorks
$ rm -rf ServiceHost
$ ln -s /scratch/zhang2/ServiceHost ServiceHost
$ cd current directory

Then if you check with:

$ ls -l
