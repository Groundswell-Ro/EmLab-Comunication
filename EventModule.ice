module EventModule
{

	enum Table {
		clients,
		events,
		services
	};

	enum EventField
	{
		clientId,
		dateTime,
		date,
		time,
		duration,
		location,
		description
	}; 

	enum ServiceField
	{
		providerIdentity,
		providerService,
		dateTime,
		duration,
		cost,
		description,
		observations
	};

	enum ClientField
	{
		name,
		phone,
		specialNote
	};

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


	interface EventInterface
    {
		SeqEventData getEventsData(string userToken);

		SeqClientInfo getClientsByName(string userToken, string partialName);
		SeqClientInfo getClientsByPhone(string userToken, string partialPhone);

		EventData getEventData(string userToken, int eventId);
		SeqEventData getTenEvents(string userToken, string fromDate,int offset);
        EventData registerEvent(string userToken, EventData eventData);

		void modifyEventIntField(string userToken, int eventId, EventField field, int newValue );
		void modifyEventStringField(string userToken, int eventId, EventField field ,string newValue);
		void modifyEventDoubleField(string userToken, int eventId, EventField field , double newValue);

        void addServiceToEvent(string userToken, ServiceInfo serviceInfo);
		void modifyServiceIntField(string userToken, int serviceId, ServiceField field, int newValue );
		void modifyServiceStringField(string userToken, int serviceId, ServiceField field ,string newValue);
		void modifyServiceDoubleField(string userToken, int serviceId, ServiceField field , double newValue);

        int registerClient(string userToken, ClientInfo clientInfo);
		void modifyClient(string userToken, ClientInfo clientInfo);

		void deleteRecord(string userToken, Table table, int id);


    }
}