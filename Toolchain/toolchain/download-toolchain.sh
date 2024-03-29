for i in /root/Toolchain/toolchain/*.txt
  do 
    aria2c --input-file=/root/Toolchain/toolchain/$i
  done
