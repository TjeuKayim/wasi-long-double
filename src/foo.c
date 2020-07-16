#include <stdlib.h>
#include <stdio.h>

void print_long_double() {
    srand(0);
    long double x = rand();
    printf("x = %Lf\n", x);
}

void print_double() {
    srand(0);
    double x = rand();
    printf("x = %f\n", x);
}
