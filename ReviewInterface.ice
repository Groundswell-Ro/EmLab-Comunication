#include <DataTypes.ice>

module Emlab {

    struct ReviewInfo {
        string author;
        ImageData authorPhoto;
        string reviewTitle;
        string review;
        ImageList reviewImages;
        int rating;
    };
    sequence<ReviewInfo> reviewList;

    interface ReviewInterface {
        reviewList getReviewInfo(string providerEmail);
    };

};