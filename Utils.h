#pragma once
#include "generated/DataTypes.h"
#include <string>
#include <fstream>

namespace Emlab
{
    ImageData imageToBytes(const std::string& imagePath);
 	bool bytesToImage(const ImageData& bytes, const std::string& imagePath);
};