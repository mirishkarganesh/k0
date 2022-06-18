# Installation setup

  Steps:

    (1)
    go to tools/  
    	extras/check_dependencies.sh
    	make -j 'nproc'

    (2)
    go to src/ 
    	./configure --shared
  		make depend -j 'nproc'
  		make -j 'nproc'

