#pragma once
#include <DataTypes.ice>

module Emlab
{
	interface ProviderInterface
	{
		void registerProvider(string userToken, ProviderProfileInfo providerProfileInfo);
		void registerProvicerService(string userToken, ProviderServiceInfo providerService);
		void addPhotoToService(string userToken, string serviceId, ImageData imageData);

        ProviderProfileInfo getProfileInfo(string email);
		ProfileData getProfileData(string email);
	}
}