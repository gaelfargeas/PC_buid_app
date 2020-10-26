QT += testlib
QT -= gui
QT += quick
QT += printsupport

CONFIG += qt warn_on depend_includepath testcase no_testcase_installs c++11
CONFIG -= app_bundle

TEMPLATE = app

SOURCES +=  tst_pc_build_app_tests.cpp


INCLUDEPATH = ../../

HEADERS += \
    ../../headers/computer_case.h \
    ../../headers/cooling.h \
    ../../headers/cpu.h \
    ../../headers/create_item.h \
    ../../headers/enum_headers.h \
    ../../headers/gpu.h \
    ../../headers/image_qml.h \
    ../../headers/main_class.h \
    ../../headers/make_pdf.h \
    ../../headers/motherboard.h \
    ../../headers/power_supply.h \
    ../../headers/ram.h \
    ../../headers/storage.h \
    ../../tiersparty/tableprinter/tableprinter.h


SOURCES += ../../sources/computer_case.cpp \
    ../../sources/cooling.cpp \
    ../../sources/cpu.cpp \
    ../../sources/create_item.cpp \
    ../../sources/gpu.cpp \
    ../../sources/image_qml.cpp \
    ../../sources/main_class.cpp \
    ../../sources/make_pdf.cpp \
    ../../sources/motherboard.cpp \
    ../../sources/power_supply.cpp \
    ../../sources/ram.cpp \
    ../../sources/storage.cpp \
    ../../tiersparty/tableprinter/tableprinter.cpp
