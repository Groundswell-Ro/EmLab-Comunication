#pragma once
#include <DataTypes.ice>

module Emlab
{
	interface EventInterface
	{
		int addEventInfo(string userToken, EventInfo eventInfo);
		int addEventData(string userToken, EventData eventData);
		void delEvent(string userToken, int eventId);

		void setEventDateTime(string userToken, int eventId, string newDateTime);
		void setEventDate(string userToken, int eventId, string newDate);
		void setEventTime(string userToken, int eventId, string newTime);
		void setClient(string userToken, int eventId, int clientId);
		void setDuration(string userToken, int eventId, int duration);
		void setLocation(string userToken, int eventId, string location);
		void setDescription(string userToken, int eventId, string description);

		SeqEventData getSeqEventData(string userToken);
		EventData getEventData(string userToken, int eventId);
		EventInfo getEventInfo(string userToken, int eventId);
	}
}