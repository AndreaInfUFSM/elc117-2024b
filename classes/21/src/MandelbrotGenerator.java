import javax.imageio.ImageIO;
import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

// Main class to manage Mandelbrot set generation
public class MandelbrotGenerator {
    private final int width;
    private final int height;
    private final int maxIterations;
    private final double zoom;
    private final double centerX;
    private final double centerY;
    private final int numberOfThreads;
    private BufferedImage image;

    // Constructor
    public MandelbrotGenerator(int width, int height, int maxIterations, double zoom, double centerX, double centerY, int numberOfThreads) {
        this.width = width;
        this.height = height;
        this.maxIterations = maxIterations;
        this.zoom = zoom;
        this.centerX = centerX; // -2.0 to 1.0
        this.centerY = centerY; // -1.5 to 1.5
        this.numberOfThreads = numberOfThreads;
        this.image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
    }

    // Public method to generate the Mandelbrot set image with multi-threading
    public void generateMandelbrotMultiThread() {
        int range = height / numberOfThreads;
        List<MandelbrotThread> threads = new ArrayList<>();

        // Divide the work into horizontal stripes for each thread
        for (int i = 0; i < numberOfThreads; i++) {
            int startY = i * range;
            int endY = (i == numberOfThreads - 1) ? height : (startY + range);

            MandelbrotThread thread = new MandelbrotThread(startY, endY);
            threads.add(thread);
            thread.start();
        }

        // Wait for all threads to finish
        for (MandelbrotThread thread : threads) {
            try {
                thread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    // Public method to generate the Mandelbrot set image with a single thread
    public void generateMandelbrotSingleThread() {
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) {
                int color = calculateMandelbrotColor(x, y);
                image.setRGB(x, y, color);
            }
        }
    }

    // Public method to save the generated image to a file
    public void saveImage(String fileName) {
        try {
            File outputFile = new File(fileName);
            ImageIO.write(image, "png", outputFile);
            System.out.println("Saved image: " + fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Calculate the color for a specific pixel based on the Mandelbrot formula
    private int calculateMandelbrotColor(int x, int y) {
        double zx, zy, cX, cY;
        zx = zy = 0;

        // Calculate the coordinates on the complex plane based on the zoom and center
        cX = centerX + (x - width / 2.0) / zoom;
        cY = centerY + (y - height / 2.0) / zoom;

        int iter = maxIterations;
        while (zx * zx + zy * zy < 4 && iter > 0) {
            double tmp = zx * zx - zy * zy + cX;
            zy = 2.0 * zx * zy + cY;
            zx = tmp;
            iter--;
        }

        // If we escape quickly, color it with a gradient
        if (iter > 0) {
            float hue = 0.7f + (float) iter / maxIterations;
            return Color.HSBtoRGB(hue, 0.6f, 1.0f);
        } else {
            return Color.BLACK.getRGB();
        }
    }

    // Private class to handle a portion of the Mandelbrot calculation in a separate thread
    private class MandelbrotThread extends Thread {
        private final int startY, endY;

        public MandelbrotThread(int startY, int endY) {
            this.startY = startY;
            this.endY = endY;
        }

        // Override the run() method of the Thread superclass
        @Override
        public void run() {
            for (int y = startY; y < endY; y++) {
                for (int x = 0; x < width; x++) {
                    int color = calculateMandelbrotColor(x, y);
                    image.setRGB(x, y, color);
                }
            }
        }
    }

}

