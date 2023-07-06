#pragma once
#include <DataTypes.ice>

module Emlab
{
	interface ProviderInterface
	{
		int registerProvider(string userToken, ProviderProfileInfo providerProfileInfo);
		int registerProviderService(string userToken, ProviderServiceInfo providerServiceInfo);
		void addPhotoToService(string userToken, int serviceId, ImageInfo imageInfo);

		ProfilePath getProviderProfilePath(int profileId);

		ImageData getProviderProfilePhoto(int profileId);
        ProviderProfileInfo getProfileAsUser(string userToken);
        ProviderProfileInfo getProfileAsClient(int profileId);
		SeqProviderServiceInfo getSeqProviderServices(int profileId);
		ImageInfo getProviderServicePhoto(int servicePhotoId);
	}
}