#pragma once
#include <DataTypes.ice>

module Emlab
{
	interface ProviderInterface
	{
		void setProviderProfile(string email, ProfileData profileData);

        ProviderProfileInfo getProfileInfo(string email);
		ProfileData getProfileData(string email);
	}
}