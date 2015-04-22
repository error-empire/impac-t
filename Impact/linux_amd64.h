#ifndef __INC_LINUX_AMD64
#define __INC_LINUX_AMD64

#include <stdint.h>
#include <stdio.h>
#include <time.h>
#include <string>

namespace Impact {
   namespace Linux_AMD64 {
      bool choose_file(std::string& fileName);
   }
}

#define MAX_PATH FILENAME_MAX
typedef bool BOOL;
#define TRUE 1

#endif
