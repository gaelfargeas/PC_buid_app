#include "headers/cooling.h"

cooling::cooling()
{

}

bool cooling::operator==(cooling cl)
{
    if(this->air_flow_CFM == cl.air_flow_CFM)
    {
        if(this->buy_link == cl.buy_link)
        {
            if(this->cooling_max_sound_dB == cl.cooling_max_sound_dB)
            {
                if(this->cooling_max_speed == cl.cooling_max_speed)
                {
                    if(this->cooling_min_sound_dB == cl.cooling_min_sound_dB)
                    {
                        if(this->cooling_min_speed == cl.cooling_min_speed)
                        {
                            if(this->cooling_size == cl.cooling_size)
                            {
                                if(this->image_link == cl.image_link)
                                {
                                    if(this->name == cl.name)
                                    {
                                        if(this->price == cl.price)
                                        {
                                            if(this->supported_socket == cl.supported_socket)
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
    return false;
}
