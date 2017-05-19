# silent install the dependency, VBAudio

> This feature was coded by Nutchanon Ninyawee.

Hermic client requires an dependency driver, VBAudio. Our team think that it would be nice if users does not need to install by themselves, so I coded this automation installing. This would be a part of the client installer at the end.

Using Autohotkey scripting language, I able to automate the installation of VBAudio.

## Files/Docs included
1. this readme file
2. install.ahk script file
3. .exe executable of install.ahk in repo/release
4. dependency files, REQUIRED when run install.exe/install.ahk

## Testing
### Tested System
1. Windows 10 on virtualbox - May 19, 2017

### Test cases
\# | Description | Intended result | Actual result | Completed by
-- | ----------- | --------------- | ------------- | ------------
1 | run | VBCable driver install successfully | VBCable driver install successfully | N. Ninyawee
2 | user don't give admin privillage | exit | exit | N. Ninyawee


## how to use
### 1 get all requirement files
make sure that the "VBCABLE_Driver_Pack43" and install.exe is located in the same folder.
![entireScreen](https://raw.githubusercontent.com/codustry/Hermic/master/silentInstallationVB/images/entireScreen.png)
### 2 run install.exe
run install.exe. This application will require the admin privillage to continue.
![runAsAdmin](https://raw.githubusercontent.com/codustry/Hermic/master/silentInstallationVB/images/1runAsAdminPrompt.png)
### 3 wait and installed
the script will install the VBCable driver for you. While installing, all input either typing or click will be ignored for reliability reason.
![installing](https://raw.githubusercontent.com/codustry/Hermic/master/silentInstallationVB/images/2VBCableInstallAutomation.png)
