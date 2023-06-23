#pragma once
#include <DataTypes.ice>

module Emlab {
   
   interface ServiceInterface {
        
        int addServiceToEvent(string userToken, ServiceInfo serviceInfo);
        void delService(string userToken, string serviceId);

        // void setService();
        // void setServiceCost(string userToken, string serviceId, int cost);
        // void setServiceDescription(string userToken, string serviceId, string description);
        void setServiceDate(string userToken, string serviceId, string date);
        void setServiceTime(string userToken, string serviceId, string time);
        void setServiceDuration(string userToken, string serviceId, int duration);
        void setServiceObservations(string userToken, string serviceId, string observations);
   };


};