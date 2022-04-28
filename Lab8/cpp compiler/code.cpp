#include <iostream>
#include <stdio.h>
using namespace std;
struct school
{
    char name[10];
    struct addr
    {
        int block;
        int street;
        char city[10];
    }s_addr;
};
struct student
{
    int roll;
    char name[100];
    struct school schl;
}s[10];
int main()
{
    int a=0;
    int age=1;
    for(int i=0; i<10; i++)
    {
        if(a > 0)
        {
            a--;
        }
        else {
            a++;
        }
    }
    while( a > 0 )
    {
        cout << age;
    }
    cin>age;
    return 0;
}
