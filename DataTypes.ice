#pragma once

module Emlab
{
	const string TIMEFORMAT = "HH:mm AP";
	const string DATEFORMAT = "dd/MMM/yyyy";
	const string DATETIMEFORMAT = "dd/MMM/yyyy HH:mm AP";

	sequence<byte> ImageData;
    sequence<ImageData> ImageList;
	// Authentification and Authorization
	const string ADMIN = "admin";
	const string CLIENT = "client";
	const string PROVIDER = "provider";

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

    struct ClientInfo
	{
		int 		id;
		string		name;
		string		phone;
		string		specialNote;
	}
	sequence<ClientInfo> SeqClientInfo;


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
		ClientInfo 	clientInfo;
		EventInfo 	eventInfo;
		SeqServiceInfo seqServiceInfo;
	};
	sequence<EventData> SeqEventData;
}    