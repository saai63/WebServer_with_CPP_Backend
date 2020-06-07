def sysinfo():
   import SystemTime_ext
   obj=SystemTime_ext.SystemTime_ext()
   return (obj.getSystemTime())

print(sysinfo())
