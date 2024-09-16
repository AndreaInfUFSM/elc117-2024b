#include <stdio.h>

int g = 0;

int func1(int x) {
  return x + 4;
}

int func2(int x) {
  printf("%d ", x);
  return x + 4;
}

int func3(int x) {
  g++;
  return x + 4;
}

int func4(int *x) {
  int result = *x + 4;
  *x = 2;
  return result;
}

int main() {

  int a, b, c, d, n;
  g = 1;
  n = 1;
 
  a = func1(n);
  b = func2(n);
  c = func3(n);
  d = func4(&n);

  printf("%d %d %d %d %d %d\n", g, n, a, b, c, d);

  return 0;
}

