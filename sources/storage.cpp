#include "headers/storage.h"

storage::storage()
{

}

bool storage::operator==(storage st)
{
    if(this->RPM == st.RPM)
    {
        if(this->buy_link == st.buy_link)
        {
            if(this->capacity_GO == st.capacity_GO)
            {
                if(this->image_link == st.image_link)
                {
                    if(this->name == st.name)
                    {
                        if(this->price == st.price)
                        {
                            if(this->read_speed == st.read_speed)
                            {
                                if(this->type == st.type)
                                {
                                    if(this->write_speed == st.write_speed)
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
