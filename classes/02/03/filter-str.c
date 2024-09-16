#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main() {
  char *sstr = "a-bra-ca-da-bra";
  char *rstr = malloc(strlen(sstr) + 1);

  int rindex = 0;
  for (int i = 0; i < strlen(sstr); i++) {
    if (sstr[i] != '-') {
      rstr[rindex] = sstr[i];
      rindex++;
    }
  }
  rstr[rindex] = '\0';
  printf("%s\n", rstr);
}

