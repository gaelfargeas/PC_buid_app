#include "headers/gpu.h"

GPU::GPU()
{

}

bool GPU::operator==(GPU gpu)
{
    if(this->GPU_bus == gpu.GPU_bus)
    {
        if(this->GPU_core_number == gpu.GPU_core_number)
        {
            if(this->GPU_flux == gpu.GPU_flux)
            {
                if(this->GPU_ram_frequency_MHZ == gpu.GPU_ram_frequency_MHZ)
                {
                    if(this->GPU_ram_size == gpu.GPU_ram_size)
                    {
                        if(this->GPU_ram_type == gpu.GPU_ram_type)
                        {
                            if(this->boost_clock == gpu.boost_clock)
                            {
                                if(this->buy_link == gpu.buy_link)
                                {
                                    if(this->clock == gpu.clock)
                                    {
                                        if(this->image_link == gpu.image_link)
                                        {
                                            if(this->name == gpu.name)
                                            {
                                                if(this->power_clable_pin == gpu.power_clable_pin)
                                                {
                                                    if(this->power_consumption == gpu.power_consumption)
                                                    {
                                                        if(this->price == gpu.price)
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
    return false;
}
