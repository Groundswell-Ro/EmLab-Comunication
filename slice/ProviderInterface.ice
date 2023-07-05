#pragma once
#include <DataTypes.ice>

module Emlab
{
	interface ProviderInterface
	{
		int registerProvider(string userToken, ProviderProfileInfo providerProfileInfo);
		int registerProvicerService(string userToken, ProviderServiceInfo providerService);
		void addPhotoToService(string userToken, string serviceId, ImageInfo imageInfo);

		ImageData getProviderProfilePhoto(string userToken, string providerId);
        ProviderProfileInfo getProfileInfoWithIdentity(string identity);
		ProviderProfileInfo getProfileInfoWithUsername(string username);
		SeqProviderServiceInfo getSeqProviderServicesInfo(string username);

	}
}