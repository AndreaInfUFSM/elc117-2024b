#include <stdio.h>

#define ARRAY_SIZE 5

float calculate(const float arr[], int size) {
  float sum = 0.0;
  for (int i = 0; i < size; i++) {
    sum += arr[i];
  }
  return sum / size;
}

int main() {
  float numbers[ARRAY_SIZE] = {10, 20, 30, 40, 50};
  float result = calculate(numbers, ARRAY_SIZE);
  printf("Result: %.2f\n", result);
  return 0;
}


