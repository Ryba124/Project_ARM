#include <stdio.h>
#include <stdint.h>

extern const unsigned int __start___llvm_prf_cnts;
extern const unsigned int __stop___llvm_prf_cnts;

int main()
{
    uint32_t testVar = 0U;
    for (int i = 0; i < 100; i++)
    {
        // printf("My Var has specific value: %d\n", testVar);
        testVar++;
    }

    FILE *fptr;
    // Open a file in writing mode
    fptr = fopen("C:/Logs/log.txt", "w");
    const unsigned int *countersStart = &__start___llvm_prf_cnts;
    const unsigned int *countersEnd = &__stop___llvm_prf_cnts;
    size_t countersSize = countersEnd - countersStart;
    countersSize*=4;
    if(fptr != nullptr)
    {
        fwrite(countersStart, 1, countersSize, fptr);
        fclose(fptr);
    }
    // fprintf(fptr, "%.*s",countersSize,buffer);
    // Write some text to the file
    //fprintf(fptr, "Kubus papuga jest super papuzka");

    // Close the file


    return 0U;
}