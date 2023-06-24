#pragma once

module Emlab
{
	// Addapters
	const string AUTHADAPTER = "auth";
	const string EVENTADAPTER = "event";
	const string SERVICEADAPTER = "service";
	const string REVIEWADAPTER = "review";
	const string CLIENTADAPTER = "client";

	const string TIMEFORMAT = "HH:mm AP";
	const string DATEFORMAT = "dd/MMM/yyyy";
	const string DATETIMEFORMAT = "dd/MMM/yyyy HH:mm AP";

	sequence<byte> ImageData;
    sequence<ImageData> SeqImageData;

	const string ADMINROLE = "admin";
	const string CLIENTROLE = "client";
	const string PROVIDERROLE = "provider";

	enum LoginResponse { NotIdentified, Identified, LoggedIn, IncorectPassword, ThrottlingActivated };
	enum RegistrationResponse { RegistrationSuccessful ,EmailAlreadyExists, PhoneAlreadyExists };
	enum ChangePasswordResponse { PasswordChanged, PasswordNotChanged, OldPasswordIncorrect};
	
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
		string role;
		LoginResponse loginResponse;
	}


    struct ClientInfo
	{
		int 		id;
		string		name;
		string		phone;
		ImageData	photo;
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