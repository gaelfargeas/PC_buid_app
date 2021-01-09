/****************************************************************************
** Meta object code from reading C++ file 'create_item.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../headers/create_item.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'create_item.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Create_item_t {
    QByteArrayData data[78];
    char stringdata0[1100];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Create_item_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Create_item_t qt_meta_stringdata_Create_item = {
    {
QT_MOC_LITERAL(0, 0, 11), // "Create_item"
QT_MOC_LITERAL(1, 12, 11), // "create_case"
QT_MOC_LITERAL(2, 24, 0), // ""
QT_MOC_LITERAL(3, 25, 4), // "name"
QT_MOC_LITERAL(4, 30, 26), // "supported_motherboard_type"
QT_MOC_LITERAL(5, 57, 5), // "price"
QT_MOC_LITERAL(6, 63, 8), // "buy_link"
QT_MOC_LITERAL(7, 72, 10), // "image_link"
QT_MOC_LITERAL(8, 83, 18), // "create_motherboard"
QT_MOC_LITERAL(9, 102, 7), // "MB_type"
QT_MOC_LITERAL(10, 110, 10), // "CPU_socket"
QT_MOC_LITERAL(11, 121, 11), // "CPU_chipset"
QT_MOC_LITERAL(12, 133, 8), // "RAM_type"
QT_MOC_LITERAL(13, 142, 19), // "RAM_speed_supported"
QT_MOC_LITERAL(14, 162, 15), // "RAM_slot_number"
QT_MOC_LITERAL(15, 178, 16), // "RAM_max_capacity"
QT_MOC_LITERAL(16, 195, 16), // "RAM_max_per_slot"
QT_MOC_LITERAL(17, 212, 21), // "GPU_PCIE20_16x_number"
QT_MOC_LITERAL(18, 234, 20), // "GPU_PCIE20_8x_number"
QT_MOC_LITERAL(19, 255, 20), // "GPU_PCIE20_4x_number"
QT_MOC_LITERAL(20, 276, 20), // "GPU_PCIE20_1x_number"
QT_MOC_LITERAL(21, 297, 21), // "GPU_PCIE30_16x_number"
QT_MOC_LITERAL(22, 319, 20), // "GPU_PCIE30_8x_number"
QT_MOC_LITERAL(23, 340, 20), // "GPU_PCIE30_4x_number"
QT_MOC_LITERAL(24, 361, 20), // "GPU_PCIE30_1x_number"
QT_MOC_LITERAL(25, 382, 16), // "SATA_slot_number"
QT_MOC_LITERAL(26, 399, 15), // "M_2_slot_number"
QT_MOC_LITERAL(27, 415, 9), // "power_pin"
QT_MOC_LITERAL(28, 425, 10), // "create_CPU"
QT_MOC_LITERAL(29, 436, 6), // "socket"
QT_MOC_LITERAL(30, 443, 17), // "supported_chipset"
QT_MOC_LITERAL(31, 461, 11), // "clock_speed"
QT_MOC_LITERAL(32, 473, 13), // "boosted_speed"
QT_MOC_LITERAL(33, 487, 11), // "cache_L3_Mo"
QT_MOC_LITERAL(34, 499, 11), // "core_number"
QT_MOC_LITERAL(35, 511, 13), // "thread_number"
QT_MOC_LITERAL(36, 525, 3), // "TDP"
QT_MOC_LITERAL(37, 529, 18), // "supported_RAM_type"
QT_MOC_LITERAL(38, 548, 17), // "max_RAM_speed_MHZ"
QT_MOC_LITERAL(39, 566, 14), // "create_cooling"
QT_MOC_LITERAL(40, 581, 16), // "supported_socket"
QT_MOC_LITERAL(41, 598, 12), // "cooling_size"
QT_MOC_LITERAL(42, 611, 20), // "cooling_min_sound_dB"
QT_MOC_LITERAL(43, 632, 20), // "cooling_max_sound_dB"
QT_MOC_LITERAL(44, 653, 17), // "cooling_min_speed"
QT_MOC_LITERAL(45, 671, 17), // "cooling_max_speed"
QT_MOC_LITERAL(46, 689, 12), // "air_flow_CFM"
QT_MOC_LITERAL(47, 702, 10), // "create_RAM"
QT_MOC_LITERAL(48, 713, 4), // "TYPE"
QT_MOC_LITERAL(49, 718, 11), // "memory_size"
QT_MOC_LITERAL(50, 730, 12), // "memory_speed"
QT_MOC_LITERAL(51, 743, 11), // "cas_latency"
QT_MOC_LITERAL(52, 755, 13), // "module_number"
QT_MOC_LITERAL(53, 769, 10), // "create_GPU"
QT_MOC_LITERAL(54, 780, 5), // "clock"
QT_MOC_LITERAL(55, 786, 11), // "boost_clock"
QT_MOC_LITERAL(56, 798, 15), // "GPU_core_number"
QT_MOC_LITERAL(57, 814, 7), // "GPU_bus"
QT_MOC_LITERAL(58, 822, 12), // "GPU_ram_type"
QT_MOC_LITERAL(59, 835, 12), // "GPU_ram_size"
QT_MOC_LITERAL(60, 848, 21), // "GPU_ram_frequency_MHZ"
QT_MOC_LITERAL(61, 870, 8), // "GPU_flux"
QT_MOC_LITERAL(62, 879, 17), // "power_consumption"
QT_MOC_LITERAL(63, 897, 16), // "power_clable_pin"
QT_MOC_LITERAL(64, 914, 14), // "create_storage"
QT_MOC_LITERAL(65, 929, 10), // "read_speed"
QT_MOC_LITERAL(66, 940, 11), // "write_speed"
QT_MOC_LITERAL(67, 952, 4), // "type"
QT_MOC_LITERAL(68, 957, 8), // "capacity"
QT_MOC_LITERAL(69, 966, 3), // "RPM"
QT_MOC_LITERAL(70, 970, 19), // "create_power_supply"
QT_MOC_LITERAL(71, 990, 8), // "standard"
QT_MOC_LITERAL(72, 999, 7), // "power_W"
QT_MOC_LITERAL(73, 1007, 16), // "sata_power_cable"
QT_MOC_LITERAL(74, 1024, 19), // "pcie6_2_power_cable"
QT_MOC_LITERAL(75, 1044, 18), // "ATX_24_power_cable"
QT_MOC_LITERAL(76, 1063, 17), // "ATX_4_power_cable"
QT_MOC_LITERAL(77, 1081, 18) // "molex4_power_cable"

    },
    "Create_item\0create_case\0\0name\0"
    "supported_motherboard_type\0price\0"
    "buy_link\0image_link\0create_motherboard\0"
    "MB_type\0CPU_socket\0CPU_chipset\0RAM_type\0"
    "RAM_speed_supported\0RAM_slot_number\0"
    "RAM_max_capacity\0RAM_max_per_slot\0"
    "GPU_PCIE20_16x_number\0GPU_PCIE20_8x_number\0"
    "GPU_PCIE20_4x_number\0GPU_PCIE20_1x_number\0"
    "GPU_PCIE30_16x_number\0GPU_PCIE30_8x_number\0"
    "GPU_PCIE30_4x_number\0GPU_PCIE30_1x_number\0"
    "SATA_slot_number\0M_2_slot_number\0"
    "power_pin\0create_CPU\0socket\0"
    "supported_chipset\0clock_speed\0"
    "boosted_speed\0cache_L3_Mo\0core_number\0"
    "thread_number\0TDP\0supported_RAM_type\0"
    "max_RAM_speed_MHZ\0create_cooling\0"
    "supported_socket\0cooling_size\0"
    "cooling_min_sound_dB\0cooling_max_sound_dB\0"
    "cooling_min_speed\0cooling_max_speed\0"
    "air_flow_CFM\0create_RAM\0TYPE\0memory_size\0"
    "memory_speed\0cas_latency\0module_number\0"
    "create_GPU\0clock\0boost_clock\0"
    "GPU_core_number\0GPU_bus\0GPU_ram_type\0"
    "GPU_ram_size\0GPU_ram_frequency_MHZ\0"
    "GPU_flux\0power_consumption\0power_clable_pin\0"
    "create_storage\0read_speed\0write_speed\0"
    "type\0capacity\0RPM\0create_power_supply\0"
    "standard\0power_W\0sata_power_cable\0"
    "pcie6_2_power_cable\0ATX_24_power_cable\0"
    "ATX_4_power_cable\0molex4_power_cable"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Create_item[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    5,   54,    2, 0x02 /* Public */,
       8,   23,   65,    2, 0x02 /* Public */,
      28,   14,  112,    2, 0x02 /* Public */,
      39,   11,  141,    2, 0x02 /* Public */,
      47,    9,  164,    2, 0x02 /* Public */,
      53,   14,  183,    2, 0x02 /* Public */,
      64,    9,  212,    2, 0x02 /* Public */,
      70,   11,  231,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::Double, QMetaType::QString, QMetaType::QString,    3,    4,    5,    6,    7,
    QMetaType::Void, QMetaType::QString, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::QString, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::QString, QMetaType::Double, QMetaType::QString,    3,    9,   10,   11,   12,   13,   14,   15,   16,   17,   18,   19,   20,   21,   22,   23,   24,   25,   26,   27,    7,    5,    6,
    QMetaType::Void, QMetaType::QString, QMetaType::Int, QMetaType::QString, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::QString, QMetaType::Double, QMetaType::QString,    3,   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,    7,    5,    6,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::Int, QMetaType::Double, QMetaType::Double, QMetaType::Int, QMetaType::Int, QMetaType::Double, QMetaType::QString, QMetaType::Double, QMetaType::QString,    3,   40,   41,   42,   43,   44,   45,   46,    7,    5,    6,
    QMetaType::Void, QMetaType::QString, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::QString, QMetaType::Int, QMetaType::Int, QMetaType::Double, QMetaType::QString,    3,   48,   49,   50,    7,   51,   52,    5,    6,
    QMetaType::Void, QMetaType::QString, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::QString, QMetaType::Double, QMetaType::QString,    3,   54,   55,   56,   57,   58,   59,   60,   61,   62,   63,    7,    5,    6,
    QMetaType::Void, QMetaType::QString, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::QString, QMetaType::Double, QMetaType::QString,    3,   65,   66,   67,   68,   69,    7,    5,    6,
    QMetaType::Void, QMetaType::QString, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::QString, QMetaType::Double, QMetaType::QString,    3,   71,   72,   73,   74,   75,   76,   77,    7,    5,    6,

       0        // eod
};

void Create_item::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Create_item *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->create_case((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< double(*)>(_a[3])),(*reinterpret_cast< QString(*)>(_a[4])),(*reinterpret_cast< QString(*)>(_a[5]))); break;
        case 1: _t->create_motherboard((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])),(*reinterpret_cast< int(*)>(_a[4])),(*reinterpret_cast< int(*)>(_a[5])),(*reinterpret_cast< QString(*)>(_a[6])),(*reinterpret_cast< int(*)>(_a[7])),(*reinterpret_cast< int(*)>(_a[8])),(*reinterpret_cast< int(*)>(_a[9])),(*reinterpret_cast< int(*)>(_a[10])),(*reinterpret_cast< int(*)>(_a[11])),(*reinterpret_cast< int(*)>(_a[12])),(*reinterpret_cast< int(*)>(_a[13])),(*reinterpret_cast< int(*)>(_a[14])),(*reinterpret_cast< int(*)>(_a[15])),(*reinterpret_cast< int(*)>(_a[16])),(*reinterpret_cast< int(*)>(_a[17])),(*reinterpret_cast< int(*)>(_a[18])),(*reinterpret_cast< int(*)>(_a[19])),(*reinterpret_cast< int(*)>(_a[20])),(*reinterpret_cast< QString(*)>(_a[21])),(*reinterpret_cast< double(*)>(_a[22])),(*reinterpret_cast< QString(*)>(_a[23]))); break;
        case 2: _t->create_CPU((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])),(*reinterpret_cast< int(*)>(_a[4])),(*reinterpret_cast< int(*)>(_a[5])),(*reinterpret_cast< int(*)>(_a[6])),(*reinterpret_cast< int(*)>(_a[7])),(*reinterpret_cast< int(*)>(_a[8])),(*reinterpret_cast< int(*)>(_a[9])),(*reinterpret_cast< int(*)>(_a[10])),(*reinterpret_cast< int(*)>(_a[11])),(*reinterpret_cast< QString(*)>(_a[12])),(*reinterpret_cast< double(*)>(_a[13])),(*reinterpret_cast< QString(*)>(_a[14]))); break;
        case 3: _t->create_cooling((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])),(*reinterpret_cast< double(*)>(_a[4])),(*reinterpret_cast< double(*)>(_a[5])),(*reinterpret_cast< int(*)>(_a[6])),(*reinterpret_cast< int(*)>(_a[7])),(*reinterpret_cast< double(*)>(_a[8])),(*reinterpret_cast< QString(*)>(_a[9])),(*reinterpret_cast< double(*)>(_a[10])),(*reinterpret_cast< QString(*)>(_a[11]))); break;
        case 4: _t->create_RAM((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])),(*reinterpret_cast< int(*)>(_a[4])),(*reinterpret_cast< QString(*)>(_a[5])),(*reinterpret_cast< int(*)>(_a[6])),(*reinterpret_cast< int(*)>(_a[7])),(*reinterpret_cast< double(*)>(_a[8])),(*reinterpret_cast< QString(*)>(_a[9]))); break;
        case 5: _t->create_GPU((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])),(*reinterpret_cast< int(*)>(_a[4])),(*reinterpret_cast< int(*)>(_a[5])),(*reinterpret_cast< int(*)>(_a[6])),(*reinterpret_cast< int(*)>(_a[7])),(*reinterpret_cast< int(*)>(_a[8])),(*reinterpret_cast< int(*)>(_a[9])),(*reinterpret_cast< int(*)>(_a[10])),(*reinterpret_cast< int(*)>(_a[11])),(*reinterpret_cast< QString(*)>(_a[12])),(*reinterpret_cast< double(*)>(_a[13])),(*reinterpret_cast< QString(*)>(_a[14]))); break;
        case 6: _t->create_storage((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])),(*reinterpret_cast< int(*)>(_a[4])),(*reinterpret_cast< int(*)>(_a[5])),(*reinterpret_cast< int(*)>(_a[6])),(*reinterpret_cast< QString(*)>(_a[7])),(*reinterpret_cast< double(*)>(_a[8])),(*reinterpret_cast< QString(*)>(_a[9]))); break;
        case 7: _t->create_power_supply((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])),(*reinterpret_cast< int(*)>(_a[4])),(*reinterpret_cast< int(*)>(_a[5])),(*reinterpret_cast< int(*)>(_a[6])),(*reinterpret_cast< int(*)>(_a[7])),(*reinterpret_cast< int(*)>(_a[8])),(*reinterpret_cast< QString(*)>(_a[9])),(*reinterpret_cast< double(*)>(_a[10])),(*reinterpret_cast< QString(*)>(_a[11]))); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject Create_item::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Create_item.data,
    qt_meta_data_Create_item,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *Create_item::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Create_item::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Create_item.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Create_item::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 8;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
