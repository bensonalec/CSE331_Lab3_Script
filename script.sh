cd simplesim-3.0/
make clean
make config-pisa
make
mkdir lab3
cp ./config/default.cfg lab3
cd lab3
cp default.cfg config_a.cfg
cd ..
cp ./tests-pisa/bin.little/test-math lab3
cd lab3
echo "
#
# default sim-outorder configuration
#

# random number generator seed (0 for timer seed)
-seed                             1 

# instruction fetch queue size (in insts)
-fetch:ifqsize                    1 

# extra branch mis-prediction latency
-fetch:mplat                      3 

# branch predictor type {nottaken|taken|perfect|bimod|2lev}
-bpred                        bimod 

# bimodal predictor BTB size
-bpred:bimod                   2048 

# 2-level predictor config (<l1size> <l2size> <hist_size>)
-bpred:2lev            1 1024 8 

# instruction decode B/W (insts/cycle)
-decode:width                     1

# instruction issue B/W (insts/cycle)
-issue:width                      1 

# run pipeline with in-order issue
-issue:inorder                true 

# issue instructions down wrong execution paths
-issue:wrongpath               true 

# register update unit (RUU) size
-ruu:size                        8 

# load/store queue (LSQ) size
-lsq:size                         8 

# l1 data cache config, i.e., {<config>|none}
-cache:dl1             dl1:128:32:4:l 

# l1 data cache hit latency (in cycles)
-cache:dl1lat                     1 

# l2 data cache config, i.e., {<config>|none}
-cache:dl2             ul2:1024:64:4:l 

# l2 data cache hit latency (in cycles)
-cache:dl2lat                     6 

# l1 inst cache config, i.e., {<config>|dl1|dl2|none}
-cache:il1             il1:512:32:1:l 

# l1 instruction cache hit latency (in cycles)
-cache:il1lat                     1 

# l2 instruction cache config, i.e., {<config>|dl2|none}
-cache:il2                      dl2 

# l2 instruction cache hit latency (in cycles)
-cache:il2lat                     6 

# flush caches on system calls
-cache:flush                  false 

# convert 64-bit inst addresses to 32-bit inst equivalents
-cache:icompress              false 

# memory access latency (<first_chunk> <inter_chunk>)
-mem:lat               18 2 

# memory access bus width (in bytes)
-mem:width                        8 

# instruction TLB config, i.e., {<config>|none}
-tlb:itlb              itlb:16:4096:4:l 

# data TLB config, i.e., {<config>|none}
-tlb:dtlb              dtlb:32:4096:4:l 

# inst/data TLB miss latency (in cycles)
-tlb:lat                         30 

# total number of integer ALU's available
-res:ialu                         1 

# total number of integer multiplier/dividers available
-res:imult                        1 

# total number of memory system ports available (to CPU)
-res:memport                      1 

# total number of floating point ALU's available
-res:fpalu                        1 

# total number of floating point multiplier/dividers available
-res:fpmult                       1 

# operate in backward-compatible bugs mode (for testing only)
-bugcompat                    false 

" > config_a.cfg
echo "
#
# default sim-outorder configuration
#

# random number generator seed (0 for timer seed)
-seed                             1 

# instruction fetch queue size (in insts)
-fetch:ifqsize                    1 

# extra branch mis-prediction latency
-fetch:mplat                      3 

# branch predictor type {nottaken|taken|perfect|bimod|2lev}
-bpred                        bimod 

# bimodal predictor BTB size
-bpred:bimod                   2048 

# 2-level predictor config (<l1size> <l2size> <hist_size>)
-bpred:2lev            1 1024 8 

# instruction decode B/W (insts/cycle)
-decode:width                     1

# instruction issue B/W (insts/cycle)
-issue:width                      1 

# run pipeline with in-order issue
-issue:inorder                false 

# issue instructions down wrong execution paths
-issue:wrongpath               true 

# register update unit (RUU) size
-ruu:size                        8 

# load/store queue (LSQ) size
-lsq:size                         8 

# l1 data cache config, i.e., {<config>|none}
-cache:dl1             dl1:128:32:4:l 

# l1 data cache hit latency (in cycles)
-cache:dl1lat                     1 

# l2 data cache config, i.e., {<config>|none}
-cache:dl2             ul2:1024:64:4:l 

# l2 data cache hit latency (in cycles)
-cache:dl2lat                     6 

# l1 inst cache config, i.e., {<config>|dl1|dl2|none}
-cache:il1             il1:512:32:1:l 

# l1 instruction cache hit latency (in cycles)
-cache:il1lat                     1 

# l2 instruction cache config, i.e., {<config>|dl2|none}
-cache:il2                      dl2 

# l2 instruction cache hit latency (in cycles)
-cache:il2lat                     6 

# flush caches on system calls
-cache:flush                  false 

# convert 64-bit inst addresses to 32-bit inst equivalents
-cache:icompress              false 

# memory access latency (<first_chunk> <inter_chunk>)
-mem:lat               18 2 

# memory access bus width (in bytes)
-mem:width                        8 

# instruction TLB config, i.e., {<config>|none}
-tlb:itlb              itlb:16:4096:4:l 

# data TLB config, i.e., {<config>|none}
-tlb:dtlb              dtlb:32:4096:4:l 

# inst/data TLB miss latency (in cycles)
-tlb:lat                         30 

# total number of integer ALU's available
-res:ialu                         1 

# total number of integer multiplier/dividers available
-res:imult                        1 

# total number of memory system ports available (to CPU)
-res:memport                      1 

# total number of floating point ALU's available
-res:fpalu                        1 

# total number of floating point multiplier/dividers available
-res:fpmult                       1 

# operate in backward-compatible bugs mode (for testing only)
-bugcompat                    false 

" > config_b.cfg
/simplescalar/simplesim-3.0/sim-outorder -config config_a.cfg -ptrace config_a.trc 0:1024 -redir:sim sim_configa.out ./test-math
/simplescalar/simplesim-3.0/sim-outorder -config config_b.cfg -ptrace config_b.trc 0:1024 -redir:sim sim_configb.out ./test-math
