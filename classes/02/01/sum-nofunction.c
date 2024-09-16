#include <stdio.h>

int main() {
  float numbers[] = {10, 20, 30, 40, 50};
  float s = 0.0;
  for (int i = 0; i < 5; i++) {
    s += numbers[i];
  }
  float result = s / 5;
  printf("Result: %.2f\n", result);
  return 0;
}


