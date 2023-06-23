#pragma once
#include <DataTypes.ice>

module Emlab {

	struct ReviewInfo {
		int id;
		int authorId;
        string author;
		string title;
		string content;
		int rating;
		ImageData authorPhoto;
		SeqImageData images;
	};
    
	sequence<ReviewInfo> SeqReviewInfo;

    interface ReviewInterface { 
        int addReview(string userToken, ReviewInfo reviewInfo);
        void delReview(string userToken, int reviewId);

        void setReviewTitle(string userToken, int reviewId, string title);
        void setReviewContent(string userToken, int reviewId, string content);
        void setReviewRating(string userToken, int reviewId, int rating);
        
        void addReviewPhoto(string userToken, int reviewId, ImageData imageData);
        void delReviewPhoto(string userToken, int reviewId, int photoId);

        SeqReviewInfo getSeqReviewInfo(string providerEmail);
    };

};