#pragma once

module Emlab
{
	// Addapters
	const string AUTHADAPTER = "auth";
	const string EVENTADAPTER = "event";
	const string PROVIDERADAPTER = "provider";
	// const string REVIEWADAPTER = "review";

	// time formats
	const string TIMEFORMAT = "HH:mm AP";
	const string DATEFORMAT = "dd/MMM/yyyy";
	const string DATETIMEFORMAT = "dd/MMM/yyyy HH:mm AP";

	// images data types
	sequence<byte> ImageData;
    sequence<ImageData> SeqImageData;

	// user roles
	const string ADMINROLE = "admin";
	const string CLIENTROLE = "client";
	const string PROVIDERROLE = "provider";

	// Auth responses
	enum LoginResponse { NotIdentified, Identified, LoggedIn, IncorectPassword, ThrottlingActivated };
	enum RegistrationResponse { RegistrationSuccessful ,EmailAlreadyExists, PhoneAlreadyExists };
	enum ChangePasswordResponse { PasswordChanged, PasswordNotChanged, OldPasswordIncorrect};
	enum ChangeUniqueDataResponse {NotChanged, Changed, AllreadyExists};
	// this enum is for data like email, phone number, name and username
	// Auth data structures
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

	struct UserInfo {
		string email;
		string name;
		string phone;
		string role;
		bool darkMode;
	}

	struct LoginReturn
	{
		string token;
		UserInfo userInfo;
		LoginResponse loginResponse;
	}




	struct ServiceInfo
	{
		int 	id;
		int		eventId;
		string	providerIdentity;
		string	providerService;
		string	dateTime;
		double	duration;
		int		cost;
		string	description;
		string	observations;
	}
	sequence<ServiceInfo> SeqServiceInfo;

	struct EventInfo
	{
		int 			id;
		int				clientId;
		double			duration;
		string			dateTime;
		string			location;
		string			description;
	}
	sequence<EventInfo> SeqEventInfo;

	struct EventData
	{
		// ClientInfo 	clientInfo;
		EventInfo 	eventInfo;
		SeqServiceInfo seqServiceInfo;
	};
	sequence<EventData> SeqEventData;


	// provider profile data structures
	struct ProviderProfileInfo
	{
		string username;
		string name;
		string phone;
		string email;
		string description;
	}; 

	struct ProviderServiceInfo
	{
		string title;
		string description;
		int price;
	};
	sequence<ProviderServiceInfo> SeqProviderServiceInfo;

	struct ProfileData
	{
		ProviderProfileInfo providerProfileInfo;
		SeqProviderServiceInfo seqProviderServiceInfo;
	};
	
	struct ReviewInfo {
		int id;
		int authorId;
        string author;
		string title;
		string content;
		int rating;
		ImageData authorPhoto;
		SeqImageData images;
	};
	sequence<ReviewInfo> SeqReviewInfo;

}