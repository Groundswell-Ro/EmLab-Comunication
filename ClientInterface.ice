#include <DataTypes.ice>

module Emlab {
   
    interface ClientInterface {

        int registerClient(string userToken, ClientInfo clientInfo);
		void modifyClient(string userToken, ClientInfo clientInfo);
        void deleteClient(string userToken, int clientId);

        SeqClientInfo getClientsByName(string userToken, string partialName);
		SeqClientInfo getClientsByPhone(string userToken, string partialPhone);

    };

};