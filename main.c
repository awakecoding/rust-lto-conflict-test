#include <stdio.h>

int *foo1(void);
int *foo2(void);

int main()
{
    printf("%d %d\n", *foo1(), *foo2());
    return 0;
}

