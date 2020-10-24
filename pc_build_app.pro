QT += quick
CONFIG += c++11

QT += printsupport

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += sources/main.cpp \
    sources/computer_case.cpp \
    sources/cooling.cpp \
    sources/cpu.cpp \
    sources/create_item.cpp \
    sources/gpu.cpp \
    sources/image_qml.cpp \
    sources/main_class.cpp \
    sources/make_pdf.cpp \
    sources/motherboard.cpp \
    sources/power_supply.cpp \
    sources/ram.cpp \
    sources/storage.cpp \
    tiersparty/tableprinter/tableprinter.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

QT_OPENGL=software

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    headers/computer_case.h \
    headers/cooling.h \
    headers/cpu.h \
    headers/create_item.h \
    headers/enum_headers.h \
    headers/gpu.h \
    headers/image_qml.h \
    headers/main_class.h \
    headers/make_pdf.h \
    headers/motherboard.h \
    headers/power_supply.h \
    headers/ram.h \
    headers/storage.h \
    tiersparty/tableprinter/tableprinter.h

DISTFILES += \
    tiersparty/tableprinter/LICENSE \
    tiersparty/tableprinter/README.md
