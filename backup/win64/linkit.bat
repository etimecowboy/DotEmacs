@echo off
SET MATLABROOT=D:\MATLAB\R2012a

mbuild -L%MATLABROOT%\extern\lib\win32\lcc matlabShell.c -leng
