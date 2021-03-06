Since version 0.7.2, msmtp can be compiled to a native Windows application
using MinGW (http://www.mingw.org/).


Differences between the UNIX and Windows versions
=================================================

- System configuration file ("msmtprc.txt"):
  The system configuration directory on Windows is your common application 
  data directory. The name of this directory depends on your user name and/or
  your Windows version and language. It is obtained from the registry:
  HKEY_LOCAL_MACHINE, 
  "Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders", 
  "Common AppData"

- User configuration file ("msmtprc.txt"):
  The home directory on Windows is given by the environment variable HOME.
  If it is unset, your local application data directory will be used instead.
  The name of this directory depends on your user name and/or your Windows
  version and language. It is obtained from the registry:
  HKEY_CURRENT_USER, 
  "Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders", 
  "AppData"

- User configuration file security checks are not done, because I do not know
  how to do this on W32. Patches are welcome.

- The name of the .netrc file is "netrc.txt". It is expected to be in the same 
  directory as the user configuration file.

- The timeout setting works for network input/output, but has no effect for
  the connection attempt. This is because I do not know how to do this on W32.
  See src/net.c, function net_connect() for W32_NATIVE. Patches are welcome.
