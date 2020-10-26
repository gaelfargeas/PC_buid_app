#include "headers/ram.h"

RAM::RAM()
{

}

bool RAM::operator==(RAM ram)
{
    if(this->CAS_latency == ram.CAS_latency)
    {
        if(this->TYPE == ram.TYPE)
        {
            if(this->buy_link == ram.buy_link)
            {
                if(this->image_link == ram.image_link)
                {
                    if(this->memory_size == ram.memory_size)
                    {
                        if(this->memory_speed == ram.memory_speed)
                        {
                            if(this->module_number == ram.module_number)
                            {
                                if(this->name == ram.name)
                                {
                                    if(this->price == ram.price)
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
    return false;
}
