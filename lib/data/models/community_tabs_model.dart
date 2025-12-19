class AllPosts {
  final String title;
  final String username;
  final String timeAgo;
  final String content;
  final List<String>? hashtags;
  final Poll? poll;
  final bool? isPromotional;
  final double likes;
  final double comments;
  final double shares;

  AllPosts({
    required this.title,
    required this.username,
    required this.timeAgo,
    required this.content,
    this.hashtags,
    this.poll,
    this.isPromotional,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
  });

  // copyWith method for easy updates
  AllPosts copyWith({
    String? title,
    String? username,
    String? timeAgo,
    String? content,
    List<String>? hashtags,
    Poll? poll,
    bool? isPromotional,
    double? likes,
    double? comments,
    double? shares,
  }) {
    return AllPosts(
      title: title ?? this.title,
      username: username ?? this.username,
      timeAgo: timeAgo ?? this.timeAgo,
      content: content ?? this.content,
      hashtags: hashtags ?? this.hashtags,
      poll: poll ?? this.poll,
      isPromotional: isPromotional ?? this.isPromotional,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      shares: shares ?? this.shares,
    );
  }
}

class Poll {
  final String question;
  final List<PollOption> options;
  final String promptText;

  Poll({
    required this.question,
    required this.options,
    required this.promptText,
  });
}

class PollOption {
  final String text;
  final int percentage;

  PollOption({required this.text, required this.percentage});
}

class Community {
  final String title;
  final String subtitle;
  final String buttonText;
  final String image;

  Community({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.image,
  });
}

class Trader {
  final String title;
  final String subtitle;
  final String buttonText;
  final String image;
  Trader({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.image,
  });
}

class TradeIdea {
  final String title;
  final String subtitle;
  final String buttonText;
  final String image;
  TradeIdea({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.image,
  });
}

class CommunityPost {
  final String title;
  final String subtitle;
  final String image;
  CommunityPost(this.subtitle, this.image, {required this.title});
}
