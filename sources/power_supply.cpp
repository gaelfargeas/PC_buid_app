#include "headers/power_supply.h"

power_supply::power_supply()
{

}

bool power_supply::operator==(power_supply ps)
{
    if(this->ATX_24_power_cable == ps.ATX_24_power_cable)
    {
        if(this->ATX_4_power_cable == ps.ATX_4_power_cable)
        {
            if(this->buy_link == ps.buy_link)
            {
                if(this->image_link == ps.image_link)
                {
                    if(this->molex4_power_cable == ps.molex4_power_cable)
                    {
                        if(this->name == ps.name)
                        {
                            if(this->pcie6_2_power_cable == ps.pcie6_2_power_cable)
                            {
                                if(this->power_W == ps.power_W)
                                {
                                    if(this->price == ps.price)
                                    {
                                        if(this->sata_power_cable == ps.sata_power_cable)
                                        {
                                            if(this->standard == ps.standard)
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
