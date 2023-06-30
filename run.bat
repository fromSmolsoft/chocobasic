@echo off
PowerShell.exe -Command "Start-Process PowerShell -ArgumentList '-ExecutionPolicy Bypass -File \"%~dp0ui\form.ps1\"' -Verb RunAs"
