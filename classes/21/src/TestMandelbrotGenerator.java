public class TestMandelbrotGenerator {

    // Main method to demonstrate both single-threaded and multi-threaded Mandelbrot generation
    public static void main(String[] args) {
        // Initialize Mandelbrot generator with desired parameters
        // Parameters centerX and centerY allow zooming into different regions
        // TODO: replace all parameters by named constants
        final int NUMBER_OF_THREADS = 2;
        MandelbrotGenerator generator = new MandelbrotGenerator(1920, 1080, 1000, 800, -0.75, 0, NUMBER_OF_THREADS);

        // Single-threaded generation
        long startSingleThreadTime = System.currentTimeMillis();
        generator.generateMandelbrotSingleThread();
        long singleThreadTime = System.currentTimeMillis() - startSingleThreadTime;
        System.out.println("Single-threaded generation took: " + singleThreadTime + " ms");
        generator.saveImage("mandelbrot_single_thread.png");

        // Multi-threaded generation
        long startMultiThreadTime = System.currentTimeMillis();
        generator.generateMandelbrotMultiThread();
        long multiThreadTime = System.currentTimeMillis() - startMultiThreadTime;
        System.out.println("Multi-threaded generation took: " + multiThreadTime + " ms");
        generator.saveImage("mandelbrot_multi_thread.png");

        // Compare results
        System.out.println("Speedup: " + ((double) singleThreadTime / multiThreadTime) + "x faster with " + NUMBER_OF_THREADS + " threads");
    }



}
