@echo off
SET MATLABROOT=C:\MATLAB\R2012a

mbuild -L%MATLABROOT%\extern\lib\win32\lcc matlabShell.c -leng
