#include <DataTypes.ice>

module Emlab {
   
    interface ClientInterface {

        int addClient(string userToken, ClientInfo clientInfo);
        void delClient(string userToken, int clientId);
		
        void modifyClinetName(string userToken, int clientId, string newName);
        void modifyClientPhone(string userToken, int clientId, string newPhone);
        void modifyClientSpecialNotes(string userToken, int clientId, string newSpecialNotes);

        SeqClientInfo getClientsByName(string userToken, string partialName);
		SeqClientInfo getClientsByPhone(string userToken, string partialPhone);

    };

};