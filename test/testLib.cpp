#include <getSystemTime.h>
#include <stdio.h>

int main()
{
SystemTime obj;
std::string timeRet = obj.getSystemTime();
printf("The system time is %s\n",timeRet.c_str());
return 0;
}
