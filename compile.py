import zipfile
from pathlib import Path
import os
from subprocess import call
import argparse
import sys

ignore = (Path("project\\.gitattributes"), Path("project\\.gitignore"), Path("project\\.git"))


def searchDirectory(path, myZip):
    for x in Path(path).iterdir():
        if os.path.isdir(str(x)):
            searchDirectory(str(x), myZip)
        if x not in ignore:
            myZip.write(str(x))


def Compile(name="bc", folder="project\\", buildDir="build\\", distDir="dist\\"):
    with zipfile.ZipFile(os.path.join(buildDir, name + ".love"), 'w') as myZip:
        old = os.getcwd()
        os.chdir(os.path.join(old, folder))
        searchDirectory("", myZip)
        os.chdir(old)

    call('copy /b "' + os.path.join(buildDir, "love.exe") + '"+"' + os.path.join(buildDir, name + ".love") + '" "' + os.path.join(distDir, name + ".exe") + '"', shell=True)


if len(sys.argv) == 1:
    Compile()
else:
    parser = argparse.ArgumentParser()
    parser.add_argument("-n", "-name", help="The name of the .exe.", type=str)
    parser.add_argument("-f", "-folder", help="The folder of the project to compile.", type=str)
    parser.add_argument("-b", "-build", help="The tempory folder for building the project.", type=str)
    parser.add_argument("-d", "-dist", help="The folder to put the .exe file.", type=str)
    a = parser.parse_args()
    if a.n is None:
        a.n = "bc"
    if a.f is None:
        a.f = "project\\"
    if a.b is None:
        a.b = "build\\"
    if a.d is None:
        a.d = "dist\\"
    Compile(a.n, a.f, a.b, a.d)
