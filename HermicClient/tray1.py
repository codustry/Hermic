from configobj import ConfigObj
import pystray

icon = pystray.Icon('test name')

width = height =100

from PIL import Image, ImageDraw

# Generate an image
image = Image.open('tray.ico')

icon.icon = image
icon.title = 'Hermic'

def kill():
    icon.stop()

def empty():
    pass

def readFile1(a):
    config = ConfigObj("testFile.txt")

    value1 = config['Audio bit dept']
    value2 = config['Sample Rate']

    section1 = config['section1']
    value3 = section1['8-bit']
    value4 = section1['16-bit']
    value5 = section1['32-bit']

    section2 = config['section2']
    value6 = section2['44.1 kHz']
    value7 = section2['44 kHz']
    if(value3 == "True"):
        return 1


def readFile2(a):
    config = ConfigObj("testFile.txt")

    value1 = config['Audio bit dept']
    value2 = config['Sample Rate']

    section1 = config['section1']
    value3 = section1['8-bit']
    value4 = section1['16-bit']
    value5 = section1['32-bit']

    section2 = config['section2']
    value6 = section2['44.1 kHz']
    value7 = section2['44 kHz']
    if (value4 == "True"):
        return 1

def readFile3(a):
    config = ConfigObj("testFile.txt")

    value1 = config['Audio bit dept']
    value2 = config['Sample Rate']

    section1 = config['section1']
    value3 = section1['8-bit']
    value4 = section1['16-bit']
    value5 = section1['32-bit']

    section2 = config['section2']
    value6 = section2['44.1 kHz']
    value7 = section2['44 kHz']
    if (value5 == "True"):
        return 1

def readFile4(a):
    config = ConfigObj("testFile.txt")

    value1 = config['Audio bit dept']
    value2 = config['Sample Rate']

    section1 = config['section1']
    value3 = section1['8-bit']
    value4 = section1['16-bit']
    value5 = section1['32-bit']

    section2 = config['section2']
    value6 = section2['44.1 kHz']
    value7 = section2['44 kHz']
    if (value6 == "True"):
        return 1

def readFile5(a):
    config = ConfigObj("testFile.txt")

    value1 = config['Audio bit dept']
    value2 = config['Sample Rate']

    section1 = config['section1']
    value3 = section1['8-bit']
    value4 = section1['16-bit']
    value5 = section1['32-bit']

    section2 = config['section2']
    value6 = section2['44.1 kHz']
    value7 = section2['44 kHz']
    if (value7 == "True"):
        return 1

#Write a file, In other word, try to save a new default if their are something change
def writeFile1(b):
    config = ConfigObj("testFile.txt")

    config['section1'] = {}
    config['section1']['8-bit'] = "True"
    config['section1']['16-bit'] = "False"
    config['section1']['32-bit'] = "False"
    config.write()

def writeFile2(b):
    config = ConfigObj("testFile.txt")

    config['section1'] = {}
    config['section1']['8-bit'] = "False"
    config['section1']['16-bit'] = "True"
    config['section1']['32-bit'] = "False"
    config.write()

def writeFile3(b):
    config = ConfigObj("testFile.txt")

    config['section1'] = {}
    config['section1']['8-bit'] = "False"
    config['section1']['16-bit'] = "False"
    config['section1']['32-bit'] = "True"
    config.write()

def writeFile4(b):
    config = ConfigObj("testFile.txt")

    config['section2'] = {}
    config['section2']['44.1 kHz'] = "True"
    config['section2']['44 kHz'] = "False"
    config.write()

def writeFile5(b):
    config = ConfigObj("testFile.txt")

    config['section2'] = {}
    config['section2']['44.1 kHz'] = "False"
    config['section2']['44 kHz'] = "True"
    config.write()

#Make a radio inside the audio bit dept
m6 = pystray.MenuItem('8-bit',writeFile1,checked=readFile1,radio=True)
m7 = pystray.MenuItem('16-bit',writeFile2,checked=readFile2,radio=True)
m8 = pystray.MenuItem('32-bit',writeFile3,checked=readFile3,radio=True)
menu2 = pystray.Menu(m6,m7,m8)

#Make a radio inside the sample rate
m9 = pystray.MenuItem('44.1 kHz',writeFile4,checked=readFile4,radio=True)
m10 = pystray.MenuItem('44 kHz',writeFile5,checked=readFile5,radio=True)
menu3 = pystray.Menu(m9,m10)

#Make a sub-menu in a setting
m4 = pystray.MenuItem('Audio bit dept',menu2,enabled=True)
m5 = pystray.MenuItem('Sample rate',menu3,enabled=True)
menu1 = pystray.Menu(m4,m5)

#Make a menu in tray Icon
m1 = pystray.MenuItem('Hermic 0.1a',empty,enabled=False)
m2 = pystray.MenuItem('Settings',menu1,enabled=True)
m3 = pystray.MenuItem('Exit',kill)
menu = pystray.Menu(m1,m2,m3)


icon.menu = menu

def setup(icon):
    icon.visible = True

icon.run(setup)

print(icon.name)