# ADF - Android (SELinux) Denial Fixer 

*This script essentially just scrapes avc denials from logcat, forms supolicy commands to patch them, and executes them one by one till all of them are patched.*

## Use through PC
If you don't have python3 on your android device you can use your PC. Clone the repo to your computer, connect your phone to it, and run `fix.sh`. Install python3 and adb beforehand. Then just do what the script says.

## Use through phone
If you use something like Termux and can get python3 on your device, you can use fix_phone.sh for direct usage. All you have to do is clone the repo and execute it.

`git clone https://github.com/uditkarode/ADF.git`
