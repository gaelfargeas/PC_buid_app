#include "headers/cpu.h"

CPU::CPU()
{

}

bool CPU::operator==(CPU cpu)
{
    if(this->TDP == cpu.TDP)
    {
        if(this->boosted_speed == cpu.boosted_speed)
        {
            if(this->buy_link == cpu.buy_link)
            {
                if(this->cache_L3_Mo == cpu.cache_L3_Mo)
                {
                    if(this->clock_speed == cpu.clock_speed)
                    {
                        if(this->core_number == cpu.core_number)
                        {
                            if(this->image_link == cpu.image_link)
                            {
                                if(this->max_RAM_speed_MHZ == cpu.max_RAM_speed_MHZ)
                                {
                                    if(this->name == cpu.name)
                                    {
                                        if(this->price == cpu.price)
                                        {
                                            if(this->socket == cpu.socket)
                                            {
                                                if(this->supported_RAM_type == cpu.supported_RAM_type)
                                                {
                                                    if(this->supported_chipset == cpu.supported_chipset)
                                                    {
                                                        if(this->thread_number == cpu.thread_number)
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
