import 'package:flutter_instagram_feed_ui_redesign/main.dart';
import 'package:timeago/timeago.dart' as timeago;
class Post {
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;
  String uploadTime = '';

  Post({
    this.authorName = 'default author',
    this.authorImageUrl = 'default author Image url',
    this.timeAgo = '',
    this.imageUrl = 'dafult imageurl',
  });
}

final List<Post> posts = [
  Post(
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '5 min',
    imageUrl: 'assets/images/post0.jpg',
  ),
  Post(
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '10 min',
    imageUrl: 'assets/images/post1.jpg',
  ),
];

final List<String> stories = [
  'assets/images/user1.png',
  'assets/images/user2.png',
  'assets/images/user3.png',
  'assets/images/user4.png',
];
