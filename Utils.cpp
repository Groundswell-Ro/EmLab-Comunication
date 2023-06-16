#include "Utils.h"

namespace Emlab
{
    
    AuthModule::ImageData imageToBytes(const std::string& imagePath)
    {
    std::ifstream imageFile(imagePath, std::ios::binary);
    AuthModule::ImageData imageData(
        (std::istreambuf_iterator<char>(imageFile)),
        (std::istreambuf_iterator<char>()));
    return imageData;
    }

 	bool bytesToImage(const AuthModule::ImageData& bytes, const std::string& imagePath)
    {
    std::ofstream imageFile(imagePath, std::ios::binary);
    imageFile.write(reinterpret_cast<const char*>(bytes.data()), bytes.size());

    return !imageFile.fail();
    }

}