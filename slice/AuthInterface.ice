#pragma once
#include <DataTypes.ice>

module Emlab
{

    interface AuthInterface
    {
        LoginReturn loginUser(LoginInfo loginInfo);
		RegistrationResponse registerUser(RegistrationInfo registrationInfo);
		ChangePasswordResponse changePassword(string userToken, string oldPassword, string newPassword);
		ImageData getUserPhotoWithEmail(string userEmail);
		ImageData getUserPhotoWithToken(string userToken);
		void setUserPhoto(string userToken, ImageData photo);
    }

}