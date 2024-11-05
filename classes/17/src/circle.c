#include <stdio.h>

#define PI 3.1416

// Define a structure to represent a Circle
typedef struct {
    double x;
    double y;
    double r;
} Circle;

// Function to create a Circle with default values
void initCircle(Circle* c) {
    c->x = 0.0;
    c->y = 0.0;
    c->r = 1.0;
}

// Function to create a Circle with specific values
void initCircleWithParams(Circle* c, double x, double y, double r) {
    c->x = x;
    c->y = y;
    c->r = r;
}

// Function to calculate the area of a Circle
double area(Circle* c) {
    return PI * c->r * c->r;
}

int main() {
    Circle c1; // Declare Circle c1
    Circle c2; // Declare Circle c2

    // Initialize c1 with default values
    initCircle(&c1);
    // Initialize c2 with specific values
    initCircleWithParams(&c2, 2.5, 0.0, 5.0);

    // Print the area of both circles
    printf("%lf\n", area(&c1));
    printf("%lf\n", area(&c2));

    // Assign c1 to c (simulating reference assignment in Java)
    Circle* c = &c1;
    printf("%lf\n", area(c));

    return 0;
}

