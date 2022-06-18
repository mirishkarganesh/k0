# Installation setup

Option 1 (bash + makefile):

  Steps:
    (1)
    go to tools/  
    	extras/check_dependencies.sh
    	make -j 'nproc'

    (2)
    go to src/ 
    	./configure --shared
  		make depend -j 8
  		make -j 8
