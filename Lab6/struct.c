#include <stdio.h>
struct student {
    int roll;
    char name[100];
    struct address{
        int house;
        char city[50];
    }addr;
}s[10];
int main(){
    struct student s;
}