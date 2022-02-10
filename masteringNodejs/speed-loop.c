/* 
 * C looped 1000000000 times in 2.576541 second on osx 
 * C looped 1000000000 times in 1.660506 seconds on Windows WSL
*/
#include <stdio.h>
#include <time.h>
int main () {
  int cycles = 1000000000;
  clock_t start,end;
  double duration;
  start = clock();
  for (int i = 0 ; i < cycles ; i++) {
	/* Empty Loop */ 
        }
  end = clock();
  duration = ((double)(end -start)) / CLOCKS_PER_SEC;
  printf("C looped %d times in %lf seconds\n", cycles, duration);
 return 0;
}   
