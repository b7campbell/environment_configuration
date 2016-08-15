# Bash

The bash configuration stars with bash's builtin options such as set and shopt. Then, at the top level, there are a number of interactively available aliases and functions.

bash  
 | &nbsp;&nbsp; |━ aliases-darwin.sh  
 | &nbsp;&nbsp; |━ aliases-linux.sh  
 | &nbsp;&nbsp; |━ aliases.sh  
 | &nbsp;&nbsp; |━ config-for-darwin.sh  
 | &nbsp;&nbsp; |━ config-for-linux.sh  
 | &nbsp;&nbsp; |━ functions-darwin.sh  
 | &nbsp;&nbsp; |━ functions-linux.sh  
 | &nbsp;&nbsp; |━ functions.sh  
 | &nbsp;&nbsp; |━ set.sh  
 | &nbsp;&nbsp; |━ shopt.sh  


As can be seen in the naming convention above, there are some functions and alialiases that are operating system agnostic. Others are kept in files that will be included only a darwin- or linux- type operation system.
