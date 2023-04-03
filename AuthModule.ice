module AuthModule
{
	enum LoginResponse { NotIdentified, Identified, LoggedIn, IncorectPassword, ThrottlingActivated };
	enum RegistrationResponse { RegistrationSuccessful ,EmailAlreadyExists, PhoneAlreadyExists };
	enum ChangePasswordResponse { PasswordChanged, PasswordNotChanged, OldPasswordIncorrect, ThrottlingActivated };

	// sequence<byte>	profileImageSq;
	// struct ProfileInfo {
	// 	string userName;
	// 	profileImageSq	profileImage;
	// }

	struct ServiceInfo
	{
		int 	id;
		string 	title;
		string 	description;
		int		price;
	}
	sequence<ServiceInfo> ServicesInfoSq;

	struct UserServices
	{
		string userName;
		string userPhone;
		ServicesInfoSq servicesInfoSq;
	}
	sequence<UserServices> UsersServicesSq;

	struct LoginInfo
	{
		string email;
		string password;
	}

	struct RegistrationInfo
	{
		string name;
		string email;
		string phone;
		string password;
	}

	struct LoginReturn
	{
		string name;
		string email;
		string token;
		LoginResponse loginResponse;
		ServicesInfoSq servicesInfoSq;
	}

    interface AuthInterface
    {
        LoginReturn loginUser(LoginInfo loginInfo);
		RegistrationResponse registerUser(RegistrationInfo registrationInfo);
		ChangePasswordResponse changePassword(string userToken, string oldPassword, string newPassword);
		
		void addUserService(string userToken, ServiceInfo ServiceInfo);
		void removeUserService(string userToken, int userServiceId);
		void updateUserService(string userToken, ServiceInfo userServiceInfo);

		ServicesInfoSq getSelfServices(string userToken);
		UserServices getUserServicesByEmail(string email);


		string getUserName(string userToken);
    }
}