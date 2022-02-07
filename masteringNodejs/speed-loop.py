# Python looped 1000000000 times in 34.590 seconds on osx
import time

def main() :

  cycles = 1000000000
  start = time.perf_counter()

  for i in range (0, cycles) :
    pass # Empty Loop 

  end = time.perf_counter()
  duration = end -start
 
  print("Python looped %d times in %.3f seconds" % (cycles, duration))

main()
