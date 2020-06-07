#include <time.h>
#include <sys/time.h>
#include <getSystemTime.h>
#include <stdio.h>
#include <boost/python.hpp>
#include <boost/python/module.hpp>
#include <boost/python/def.hpp>

using namespace boost::python;

std::string SystemTime::getSystemTime()
{
   time_t currTime = time(NULL);
   struct timeval tv;
   struct timezone tz;
   gettimeofday(&tv, &tz);
   struct tm *tmTime = gmtime(&currTime);
   char systemTime[1000]={0};
   sprintf(systemTime, "[%02d-%02d-%d %02d:%02d:%02d.%06ld]",tmTime->tm_mday,tmTime->tm_mon, tmTime->tm_year+1900, tmTime->tm_hour, tmTime->tm_min, tmTime->tm_sec, tv.tv_usec);
   std::string ret = std::string(systemTime);
   return ret;
}

BOOST_PYTHON_MODULE(SystemTime_ext)
{
   class_<SystemTime>("SystemTime_ext")
      .def("getSystemTime", &SystemTime::getSystemTime)
      ;
}

