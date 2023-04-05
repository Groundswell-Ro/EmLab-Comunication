module EventDataModule
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
		observations
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

	struct ClientData
	{
		int 		id;
		string		name;
		string		phone;
		string		specialNote;
	}

	sequence<ClientData> SeqClients;
	
	struct ServiceData
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
	sequence<ServiceData> SeqServices;

	
	struct EventData
	{
		int 			id;
		int				clientId;
		double			duration;
		string			dateTime;
		string			location;
		string			observations;
	}

	struct EventDataPack
	{
		ClientData 	clientData;
		EventData 	eventData;
		SeqServices seqServices;
	};


	sequence<EventDataPack> SeqEventDataPack;

	struct InitialDataSetup
	{
		SeqEventDataPack seqEventDataPack;
		SeqClients seqClients;

	};

	interface EventsDataInterface
    {
		SeqEventDataPack getEventsData(string userToken);

		SeqClients getClientsByName(string userToken, string partialName);
		SeqClients getClientsByPhone(string userToken, string partialPhone);

		EventDataPack getEventData(string userToken, int eventId);
		SeqEventDataPack getTenEvents(string userToken, string fromDate,int offset);

        EventDataPack registerEvent(string userToken, EventDataPack eventDataPack);
		void modifyEventIntField(string userToken, int eventId, EventField field, int newValue );
		void modifyEventStringField(string userToken, int eventId, EventField field ,string newValue);
		void modifyEventDoubleField(string userToken, int eventId, EventField field , double newValue);

        void addServiceToEvent(string userToken, ServiceData serviceData);
		void modifyServiceIntField(string userToken, int serviceId, ServiceField field, int newValue );
		void modifyServiceStringField(string userToken, int serviceId, ServiceField field ,string newValue);
		void modifyServiceDoubleField(string userToken, int serviceId, ServiceField field , double newValue);

        int registerClient(string userToken, ClientData clientData);
		void modifyClient(string userToken, ClientData clientData);

		void deleteRecord(string userToken, Table table, int id);


    }
}