#include <stdio.h>

// int main()
void big2()
{
    int num1, num2;

    printf("\n Enter two integers :\n");
    scanf("%d%d", &num1, &num2);

    if (num1 > num2)
    {
        printf("Largest number is %d.", num1);
    }
    else
    {
        printf("Largest number is %d.", num2);
    }

  //  return 0;
}

