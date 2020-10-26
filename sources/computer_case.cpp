#include "headers/computer_case.h"

computer_case::computer_case()
{

}

bool computer_case::operator==(computer_case c_case)
{
    if(this->buy_link == c_case.buy_link)
    {
        if(this->image_link == c_case.image_link)
        {
            if(this->name == c_case.name)
            {
                if(this->price == c_case.price)
                {
                    if(this->supported_motherboard_size == c_case.supported_motherboard_size)
                    {
                        return true;
                    }
                }
            }
        }
    }
    return false;
}
