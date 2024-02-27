  //***************************************************************************
//
// Program for education in subject "Assembly Languages"
// petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
//
// Empty project
//
//***************************************************************************

#include <stdio.h>
#include <string.h>

void testik(int a, int b, int c){
    printf(" a %d b %c c %d \n", a, b,c);
}

int add_int(int a, int b);
long add_long(long a, long b);
int str_len(char *ptr);
int suma_int(int *pole, int N);
void navelka(char *ptr);
long nejmensikladne (long *pole, int);

int main()
{
    int i = 10;
    testik(i++,i++,i++);
    printf("soucet int %d\n", add_int(10,333));
    printf("soucet long %ld\n", add_long(1000000000000,123456789));
    char pozdrav[] = "Ahoj programatori.";
    printf ("len %d \n", str_len(pozdrav));
    printf ("len %ld \n", strlen(pozdrav));

    int ipole [10] = {1,2,3,4,5,6,7,8,9,10};
    long lpole[10] = {11,-2,3,-4,5,6,7,-8,9,2};
    printf ("Soucet %d\n", suma_int(ipole,10));
    navelka( pozdrav);
    printf ("pozdrav %s\n", pozdrav);
    printf ("nejmensi kladne %ld\n", nejmensikladne(lpole,10));

}
