module AuthModule
{
	enum LoginResponse { NotIdentified, Identified, LoggedIn, IncorectPassword, ThrottlingActivated };
	enum RegistrationResponse { RegistrationSuccessful ,EmailAlreadyExists, PhoneAlreadyExists };
	enum ChangePasswordResponse { PasswordChanged, PasswordNotChanged, OldPasswordIncorrect, ThrottlingActivated };

	sequence<byte> ImageData;
	
	struct LoginInfo
	{
		string email;
		string password;
	}

	struct RegistrationInfo
	{
		string name;
		ImageData photo;
		string email;
		string phone;
		string password;
	}

	struct LoginReturn
	{
		ImageData photo;
		string name;
		string email;
		string token;
		LoginResponse loginResponse;
	}

    interface AuthInterface
    {
        LoginReturn loginUser(LoginInfo loginInfo);
		RegistrationResponse registerUser(RegistrationInfo registrationInfo);
		ChangePasswordResponse changePassword(string userToken, string oldPassword, string newPassword);
		
		string getUserName(string userToken);
    }
}