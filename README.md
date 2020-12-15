# PC_build_app

[![PyPI](https://img.shields.io/pypi/l/simplelogging.svg)](https://github.com/gaelfargeas/PC_build_app/blob/master/LICENSE)

Application that help to make computer build.

help to easily make an list of compatible components and create a pdf.

it also can check compatibility between component.

## Prerequis :

QT 5.15.1

MSVC2015_64bit (for compilation)

## Normal use :
start by select an computer case, it will show all compatible motherboard.

select an motherboard, it will show all compatible CPU.

ect.

## Menubar :

### Options

next component: move to next component type (exemple: pass from motherboard to CPU).

previous component: move to previous component type (exemple: pass from CPU to motherboard).

clear selected components: clear selected components.

quit : quit the application.

### Tools

Add component : create new component.

import components : import components current components list.

export components : export components current components list.

day/night mode : switch between day and night mode.


## TODO list :
generate an .exe with all qt package include and upload it.

add an pdf wiewer.

get image from a link (if he can't get image from the link (exemple: no internet connection) he will search in the image folder (local). So it can be use without internet connection but you have to add image to images folder before.

add a windows that allow you to compare 2 component.

add a windows that allow you to check compatibility between two component.

finish and upload Unit tests.


## WARNING/DISCLAIMER :

This application is here ONLY to help and don't replace an technician or someone who know how to build pc .

exemple: you still need to check if the watercooling can go in your computer case.


### Library used :

Qt-Table-Printer (https://github.com/T0ny0/Qt-Table-Printer , license BSD-3)
