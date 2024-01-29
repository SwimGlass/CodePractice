//gcc -O2 -S -masm=intel foo.c
int A, B;

void foo(void) {
    A = B + 1;
    asm volatile("" ::: "memory");
    B = 0;
}
