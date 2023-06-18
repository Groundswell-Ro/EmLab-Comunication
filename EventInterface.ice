#include <DataTypes.ice>

module Emlab
{
	interface EventInterface
    {
        EventData addEvent(string userToken, EventData eventData);
		void delEvent(string userToken, int eventId);

		SeqEventData getEventsData(string userToken);
        // void addServiceToEvent(string userToken, ServiceInfo serviceInfo);
		// SeqClientInfo getClientsByName(string userToken, string partialName);
		// SeqClientInfo getClientsByPhone(string userToken, string partialPhone);

		// void modifyServiceIntField(string userToken, int serviceId, ServiceField field, int newValue);
		// void modifyServiceStringField(string userToken, int serviceId, ServiceField field ,string newValue);
		// void modifyServiceDoubleField(string userToken, int serviceId, ServiceField field , double newValue);
    }
}