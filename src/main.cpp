#include <iostream>
#include <string>
#include "helpers.h"

using namespace std;

int main(const int argc, char *agrv[])
{
    if(argc < 2){
        cout << "Typephp v0.1" << endl;
        die("USAGE: typephp <filepath>");
    }

    char *filename = agrv[1];

    cout << "Typephp start parse file: " << filename << endl;

    return 0;
}
