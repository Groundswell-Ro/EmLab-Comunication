#pragma once
#include <DataTypes.ice>

module Emlab
{

    interface AuthInterface
    {
        LoginReturn loginUser(LoginInfo loginInfo);
		RegistrationResponse registerUser(RegistrationInfo registrationInfo);

		ChangePasswordResponse changePassword(string userToken, string oldPassword, string newPassword);
		
		ChangeUniqueDataResponse changeEmail(string userToken, string newEmail);
		ChangeUniqueDataResponse changePhone(string userToken, string newPhone);
		
		void setName(string userToken, string newName);
		void setDarkMode(string userToken, bool darkMode);
		void setUserPhoto(string userToken, ImageData photo);
		
		ImageData getUserPhotoWithToken(string userToken);
		ImageData getUserPhotoWithEmail(string userEmail);
    }

}