from pywinauto.application import Application

app = Application().Start(cmd_line=u'"C:\\Users\\heim\\Desktop\\VBCABLE_Driver\\VBCABLE_Setup_x64.exe" ')
vbcableinstallermainwindow = app.VBCABLE0Installer0MainWindow0
vbcableinstallermainwindow.Wait('ready')
vbcableinstallermainwindow.DrawOutline()
vbcableinstallermainwindow.click(button='left', pressed='', coords=(800, 400), double=False, absolute=True)
# click(button='left', pressed='', coords=(0, 0), double=False, absolute=False)
app.Kill_()