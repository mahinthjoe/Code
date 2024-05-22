/* JavaScript looped 100000000 times in 0.135 seconds in node v16.13.2 
 * JavaScript looped 100000000 times in 0.112 seconds in node v20.12.2
 * JavaScript looped 100000000 times in 0.036 seconds in node v20.13.1
 */
function main() {
  const cycles = 100000000;
  let start = Date.now();
  for (let i = 0; i < cycles; i++) {
	/* Empty loop */
	}
  let end = Date.now();
  let duration = (end - start) / 1000;
  console.log(" looped %d times in %d seconds", cycles, duration);
  }
main();
