enum Env { dev, production, local }

Env currentEnv = Env.dev;

//
class ApiEndpoints {
  static String host = _getBaseUrl();
  static String apiPrefix = "/api/v2/";
  static String baseUrl = host + apiPrefix;
  static const String loginPath = "auth/login";
  static const String register = "auth/register";
  static const String sendOtp = "auth/send-otp";
  static const String forgetPassword = "auth/forget-password";
  static const String verifyOtp = "auth/verify-otp";
  static const String getCities = "statics/getCities";
  static const String getLicensingAuthorities = "statics/getLicensingAuthority";
  static const String getJurisdictionsTypes = "statics/getJursisdictions";
  static const String resetPassword = "auth/reset";
  static const String topicsPath = "configurations/onboarding/topics/";
  static const String userProfilePath = "users/profile/";
  static const String emailVerificationPath = "users/verifications/";
  static const String timeLinePath = "posts/";
  static const String postsPath = "posts/";
  static const String refreshToken = "token/refresh/";
  static const String logoutPath = "logout/";
  static const String invitationsPath = "invitations/";
  static const String myPostsPath = "profile/posts/";
  static const String getPosts = "posts";
  static const String getBlogs = "blogs";
  static const String getSavedPosts = "posts-saves";
  static const String SavePosts = "community/save/add";
  static const String getPeople = "community/people";
  static const String getMe = "users/me";
  static const String getUserFollowings = "follows";
  static const String addComment = "comments";
  static const String getComments = "comments";
  static const String addOrRemoveLike = "likes";
  static const String followUnFollow = "follows";
  static const String unFollow = "community/follow/delete/";
  static const String saveOrUnSave = "posts-saves";
  static const String addPost = "community/post/add";
  static const String getProperties = "properties";
  static const String getPropertiesByOwner = "property";
  static const String getPropertiesNearsMe = "public/property/nearme";
  static const String getGooglePlaces = "google/place-search";
  static const String getAmenities = "amenities";
  static const String getProfile = "profile";
  static const String deleteMyAccount = "/users/delete-me";
  static const String updateProfile = "profile/update";
  static const String getNews = "news";
  static const String getPropertyRequests = "request-buy-property";
  static const String requestProperty = "request-buy-property";
  static const String requestSelling = "request-sell-property";
  static const String deleteRequestProperty = "request-buy-property";
  static const String editRequestProperty = "request-buy-property";
  static const String editSellingProperty = "request-sell-property";
  static const String getPropertyCategories = "categories";
  static const String getSubcategories = "subcategories";
  static const String addListing = "property/add";
  static const String getProjects = "projects";
  static const String deleteComment = "comments/";
  static const String getSavedProperties = "property/interaction";
  static const String addPropertyToSaves = "property/interaction/add";
  static const String uploadFile = "uploads";
  static const String getAgents = "users/top-performers";
  static const String deletePropertyRequest = "property-request/delete/";
  static const String deleteSellingRequest = "request-sell-property";
  static const String getSellingRequests = "request-sell-property";
  static const String getChats = "chat";
  static const String getChatMessages = "message/";
  static const String sendMessage = "message/add";
  static const String createChat = "chat/add";
  static const String getPropertyTypes = "dashboard/mobile/types";
  static const String getListingStatus = "profile/listing/web/status";
  static const String getLeadsCount = "leads";
  static const String getEmployeesCount = "company/user";
  static const String getContactAndContactRate = "company/user/contact/rate";
  static const String uploadMedia = "images/upload";

  static String _getBaseUrl() {
    if (currentEnv == Env.production) {
      return "https://truedare-v2-962081495290.us-central1.run.app";
    }
    return "https://truedare-v2-962081495290.us-central1.run.app";
  }

  static bool isProduction() {
    return currentEnv == Env.production;
  }
}
