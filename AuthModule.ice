module AuthModule
{
	enum LoginResponse { NotIdentified, Identified, LoggedIn, IncorectPassword, ThrottlingActivated };
	enum RegistrationResponse { UserRegistrationSuccessful ,UserEmailAlreadyExists };
	enum ChangePasswordResponse { PasswordChanged, PasswordNotChanged, OldPasswordIncorrect, ThrottlingActivated };

	sequence<byte>	profileImageSq;

	struct ServiceInfo
	{
		int 	id;
		string 	title;
		string 	description;
		int		price;
	}
	sequence<ServiceInfo> ServiceInfoSq;

	struct UserServices
	{
		string userName;
		ServiceInfoSq userServices;
	}
	sequence<UserServices> UserServicesSq;

	struct ProfileInfo {
		string userName;
		profileImageSq	profileImage;
	}

	struct StructLoginInfo
	{
		string userEmail;
		string userPassword;
	}

	struct StructRegistrationInfo
	{
		string userName;
		StructLoginInfo structLoginInfo;
	}

	struct StructLoginReturn
	{
		string userName;
		string userToken;
		LoginResponse loginResponse;
	}

	struct StructRegistrationReturn
	{
		StructLoginReturn structLoginReturn;
		RegistrationResponse registrationResponse;
	}
		
    interface AuthInterface
    {
        StructLoginReturn tryLogin(StructLoginInfo structLoginInfo);
		StructRegistrationReturn tryRegister(StructRegistrationInfo structRegistrationInfo);
		ChangePasswordResponse tryChangePassword(string userToken, string oldPassword, string newPassword);
		
		void addUserService(string userToken, ServiceInfo userServiceInfo);
		void removeUserService(string userToken, int userServiceId);
		void updateUserService(string userToken, ServiceInfo userServiceInfo);
		ServiceInfoSq getSelfServices(string userToken);
		UserServices getUserServicesFromUserName(string userName);


		string getUserName(string userToken);
    }
}