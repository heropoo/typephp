#include <iostream>
#include <string>
#include <string.h>
#include "helpers.h"
#include "version.h"

using namespace std;

int main(const int argc, char *agrv[])
{
    if (argc < 2)
    {
        if (tag_name.length() > 0)
        {
            printf("Typephp version %s\n", tag_name.c_str());
        }
        else
        {
            printf("Typephp version %s-%s\n", branch_name.c_str(), commit_hash.c_str());
        }
        die("USAGE: typephp <filepath>");
    }

    char *filename = agrv[1];

    cout << "Typephp start parse file: " << filename << endl;

    return 0;
}