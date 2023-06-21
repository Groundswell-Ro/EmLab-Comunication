#include <DataTypes.ice>

module Emlab
{
    
	const string ADMINROLE = "admin";
	const string CLIENTROLE = "client";
	const string PROVIDERROLE = "provider";

	enum LoginResponse { NotIdentified, Identified, LoggedIn, IncorectPassword, ThrottlingActivated };
	enum RegistrationResponse { RegistrationSuccessful ,EmailAlreadyExists, PhoneAlreadyExists };
	enum ChangePasswordResponse { PasswordChanged, PasswordNotChanged, OldPasswordIncorrect, ThrottlingActivated };
	
	struct LoginInfo
	{
		string email;
		string password;
	}

	struct RegistrationInfo
	{
		string username;
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
		string username;
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
    }

}