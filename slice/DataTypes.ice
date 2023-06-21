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