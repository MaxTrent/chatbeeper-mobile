class AppUrls {
  static const base_url = "http://chatbeeper.onrender.com/";
  static const getBeeps = "${base_url}beep";
  static const editBeeps = "${base_url}beed/62f71a5e886e6e5426e7eb1d";
  static const unlikeBeeps = "${base_url}beep/6317358a956883227889b4c2/unlike";
  static const dislikeBeeps = "${base_url}beep/62f71b85886e6e5426e7eb1f/dislike";
  static const deleteBeeps = "${base_url}beep/62f7a9fbddc2efed4353759a";
  static const likeBeeps = "${base_url}feed/62f71b85886e6e5426e7eb1f/like";
  static const unDislikeBeeps = "${base_url}feed/62f71b85886e6e5426e7eb1f/undislike";
  static const createComment = "${base_url}comment/63457b4f755869fb5e88b411/reply";
  static const getCommentReplies = "${base_url}comment/631615c75f370c671d6377a0/reply";
  static const getCommentReply = "${base_url}comment/631615c75f370c671d6377a0/reply/6325ea1246d368cff896bf54";
  static const deleteCommentReply = "${base_url}comment/631615c75f370c671d6377a0/reply/634582c665b256ab01a98a71";
  static const updateCommentReply = "${base_url}631615c75f370c671d6377a0/reply/6325ea1246d368cff896bf54";
  static const likeCommentReply = "${base_url}comment/631615c75f370c671d6377a0/reply/63458b441c6683316b9ce8ce/like";
  static const unlikeCommentReply = "${base_url}comment/631615c75f370c671d6377a0/reply/631a62d76a16efc8c6a95bc8/unlike";
  static const dislikeCommentReply = "${base_url}comment/631615c75f370c671d6377a0/reply/631a62d76a16efc8c6a95bc8/dislike";
  static const unDislikeCommentReply = "${base_url}comment/631615c75f370c671d6377a0/reply/631a62d76a16efc8c6a95bc8/undislike";

}

class ApiResponseCodes {
  static const success = 200;
  static const error = 400;
  static const internalServerError = 500;
  static const authorizationError = 401;
  static const newDevice = 180;
  static const incompleteRegistration = 190;
  static  const changePassword = -60;
}