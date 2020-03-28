#include <iostream>
#include <string>
#include <string.h>
#include "helpers.h"

using namespace std;

int main(const int argc, char *agrv[])
{
    if(argc < 2){
       // cout << "Typephp v0.1 dev" << endl;
        char short_commit_id[7];
        strncpy(short_commit_id, GIT_COMMIT_SHA1, 7);
        printf("Typephp v0.1-dev-%s\n", short_commit_id);
        die("USAGE: typephp <filepath>");
    }

    char *filename = agrv[1];

    cout << "Typephp start parse file: " << filename << endl;

    return 0;
}