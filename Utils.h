#include "AuthModule.h"
#pragma once
#include <string>
#include <fstream>

namespace Emlab
{
    const std::string time_format_ = "HH:mm AP"; 
    const std::string date_format_ = "dd/MMM/yyyy";
    const std::string datetime_format_ = date_format_ + " " + time_format_;

    AuthModule::ImageData imageToBytes(const std::string& imagePath);
 	bool bytesToImage(const AuthModule::ImageData& bytes, const std::string& imagePath);
};