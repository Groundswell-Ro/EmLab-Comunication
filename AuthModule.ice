module AuthModule
{
	enum LoginResponse { NotIdentified, Identified, LoggedIn, IncorectPassword, ThrottlingActivated };
	enum RegistrationResponse { RegistrationSuccessful ,EmailAlreadyExists, PhoneAlreadyExists };
	enum ChangePasswordResponse { PasswordChanged, PasswordNotChanged, OldPasswordIncorrect, ThrottlingActivated };
	
	const string ADMIN = "admin";
	const string CLIENT = "client";
	const string PROVIDER = "provider";

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
		string role;
	}

	struct LoginReturn
	{
		string token;
		string name;
		string email;
		ImageData photo;
		string role;
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