#include "headers/motherboard.h"

motherboard::motherboard()
{

}

bool motherboard::operator==(motherboard mb)
{
    if(this->CPU_chipset == mb.CPU_chipset)
    {
        if(this->CPU_socket == mb.CPU_socket)
        {
            if(this->GPU_PCIE_16x_number == mb.GPU_PCIE_16x_number)
            {
                if(this->GPU_PCIE_8x_number == mb.GPU_PCIE_8x_number)
                {
                    if(this->GPU_PCIE_4x_number == mb.GPU_PCIE_4x_number)
                    {
                        if(this->GPU_PCIE_1x_number == mb.GPU_PCIE_1x_number)
                        {

                            if(this->MB_type == mb.MB_type)
                            {
                                if(this->M_2_slot_number == mb.M_2_slot_number)
                                {
                                    if(this->RAM_max_capacity == mb.RAM_max_capacity)
                                    {
                                        if(this->RAM_max_per_slot == mb.RAM_max_per_slot)
                                        {
                                            if(this->RAM_slot_number == mb.RAM_slot_number)
                                            {
                                                if(this->RAM_speed_supported == mb.RAM_speed_supported)
                                                {
                                                    if(this->RAM_type == mb.RAM_type)
                                                    {
                                                        if(this->SATA_slot_number == mb.SATA_slot_number)
                                                        {
                                                            if(this->buy_link == mb.buy_link)
                                                            {
                                                                if(this->image_link == mb.image_link)
                                                                {
                                                                    if(this->name == mb.name)
                                                                    {
                                                                        if(this->power_pin == mb.power_pin)
                                                                        {
                                                                            if(this->price == mb.price)
                                                                            {
                                                                                return true;
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    return false;
}
