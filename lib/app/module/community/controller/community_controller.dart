import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_images.dart';
import '../../../../data/models/community_tabs_model.dart';

class CommunityController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedIndex = 0.obs;

  final List<String> tabs = [
    "All Posts",
    "Communities",
    "Traders",
    "Trade ideas",
  ];

  var allPosts = <AllPosts>[].obs;
  var communities = <Community>[].obs;
  var traders = <Trader>[].obs;
  var tradeIdeas = <TradeIdea>[].obs;
  var communityPost = <CommunityPost>[].obs;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        selectedIndex.value = tabController.index;
      }
    });

    loadSampleData();

    super.onInit();
  }

  /// Format counts: likes, comments, shares
  String formatCount(int count) {
    if (count >= 1000) {
      double formatted = count / 1000;
      String display = formatted.toStringAsFixed(
        formatted.truncateToDouble() == formatted ? 0 : 1,
      );
      return '${display}k';
    } else {
      return count.toString();
    }
  }

  /// Tab change
  void changeTab(int index) {
    selectedIndex.value = index;
    tabController.animateTo(index);
  }

  /// Sample Data
  void loadSampleData() {
    // All Posts Sample Data
    allPosts.addAll([
      AllPosts(
        title: 'Chris Taylor',
        username: 'usemanns344',
        timeAgo: '2h ago',
        content:
            'Every trader has that one trade forget!\n\nWas it your biggest profit, your smartest exit, or a lesson that changed the game?',
        hashtags: [
          '#TradingWins',
          '#ShareYourTrade',
          '#TraderLife',
          '#MarketMoves',
        ],
        likes: 2300,
        comments: 2300,
        shares: 345,
      ),
      AllPosts(
        title: 'Chris Taylor',
        username: 'usemanns344',
        timeAgo: '2h ago',
        content:
            'Do you think Bitcoin will hit \$40,000 by the end of this month?',
        poll: Poll(
          question:
              'Do you think Bitcoin will hit \$40,000 by the end of this month?',
          options: [
            PollOption(text: 'Yes', percentage: 69),
            PollOption(text: 'No', percentage: 31),
          ],
          promptText: 'Vote now and see what the community thinks!',
        ),
        hashtags: [
          '#TradingWins',
          '#ShareYourTrade',
          '#TraderLife',
          '#MarketMoves',
        ],
        likes: 2300,
        comments: 2300,
        shares: 345,
      ),
      AllPosts(
        title: 'Chris Taylor',
        username: 'usemanns344',
        timeAgo: '2h ago',
        content:
            'Ready to Trade Smarter? \n Gain access to my exclusive trading signals for just \$50 and start making informed moves like the pros.',
        isPromotional: true,
        hashtags: [
          '#TradingSignals',
          '#Forex',
          '#CryptoTrading',
          '#StockMarket',
          '#InvestSmart',
          '#TradingCommunity',
        ],
        likes: 2300,
        comments: 2300,
        shares: 345,
      ),
      AllPosts(
        title: 'Sarah Chen',
        username: 'sarah_trades',
        timeAgo: '4h ago',
        content:
            'Just nailed a perfect EUR/USD setup! The descending triangle pattern played out exactly as expected. Always trust your analysis! 📈',
        hashtags: ['#Forex', '#TechnicalAnalysis', '#TradingWin'],
        likes: 1247,
        comments: 89,
        shares: 23,
      ),
      AllPosts(
        title: 'Mike Rodriguez',
        username: 'crypto_mike',
        timeAgo: '6h ago',
        content:
            'ETH showing strong support at \$2,800. Thinking about adding to my position. What are your thoughts on Ethereum right now?',
        poll: Poll(
          question: 'Where do you see ETH by end of week?',
          options: [
            PollOption(text: 'Above \$3k', percentage: 45),
            PollOption(text: '\$2.8k - \$3k', percentage: 96),
            PollOption(text: 'Below \$.8k', percentage: 40),
          ],
          promptText: 'Share your prediction!',
        ),
        hashtags: ['#Ethereum', '#Crypto', '#Trading'],
        likes: 892,
        comments: 156,
        shares: 42,
      ),
    ]);

    // Communities Sample
    communities.addAll([
      Community(
        title: "Trading Signals",
        subtitle: "Public • 12.3k followers • 9+ posts",
        buttonText: "Join",
        image: AppImages.moc1,
      ),
      Community(
        title: "Trading Signals",
        subtitle: "Public • 12.3k followers • 9+ posts",
        buttonText: "Join",
        image: AppImages.moc2,
      ),
      Community(
        title: "Trading Signals",
        subtitle: "Public • 12.3k followers • 9+ posts",
        buttonText: "Join",
        image: AppImages.moc3,
      ),
      Community(
        title: "Trading Signals",
        subtitle: "Public • 12.3k followers • 9+ posts",
        buttonText: "Join",
        image: AppImages.moc1,
      ),
      Community(
        title: "Trading Signals",
        subtitle: "Public • 12.3k followers • 9+ posts",
        buttonText: "Join",
        image: AppImages.moc2,
      ),
      Community(
        title: "Trading Signals",
        subtitle: "Public • 12.3k followers • 9+ posts",
        buttonText: "Join",
        image: AppImages.moc3,
      ),
      Community(
        title: "Trading Signals",
        subtitle: "Public • 12.3k followers • 9+ posts",
        buttonText: "Join",
        image: AppImages.moc1,
      ),
      Community(
        title: "Trading Signals",
        subtitle: "Public • 12.3k followers • 9+ posts",
        buttonText: "Join",
        image: AppImages.moc2,
      ),
      Community(
        title: "Trading Signals",
        subtitle: "Public • 12.3k followers • 9+ posts",
        buttonText: "Join",
        image: AppImages.moc3,
      ),
    ]);

    // Traders Sample
    traders.addAll([
      Trader(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),
      Trader(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),
      Trader(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),
      Trader(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),
      Trader(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),
      Trader(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),
      Trader(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),
      Trader(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),
      Trader(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),
    ]);

    // Trade Ideas Sample
    tradeIdeas.addAll([
      TradeIdea(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),

      TradeIdea(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),

      TradeIdea(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),

      TradeIdea(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),

      TradeIdea(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),
      TradeIdea(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),
      TradeIdea(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),
      TradeIdea(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),
      TradeIdea(
        title: "Chris Taylor",
        subtitle: "@username34534",
        buttonText: "Follow",
        image: AppImages.mocProfile,
      ),
    ]);

    communityPost.addAll([
      CommunityPost(
        "Share a specific trade opportunity with entry, and analysis.",
        AppImages.calendar,
        title: "Trade Idea",
      ),

      CommunityPost(
        "Share your trading strategy, rules, and methodology.",
        AppImages.calendar,
        title: "Strategy Share",
      ),

      CommunityPost(
        "Share market insights, news analysis, or technical analysis.",
        AppImages.calendar,
        title: "Market Analysis",
      ),

      CommunityPost(
        "Ask the community for help, advice or opinions.",
        AppImages.calendar,
        title: "Question",
      ),

      CommunityPost(
        "Share your trading wins, lessons learned, or milestones.",
        AppImages.calendar,
        title: "Success Story",
      ),
      CommunityPost(
        "Share a specific trade opportunity with entry, and analysis.",
        AppImages.calendar,
        title: "News Room",
      ),
    ]);
  }

  /// Post Interaction Methods
  void likePost(int index) {
    if (index >= 0 && index < allPosts.length) {
      final post = allPosts[index];
      allPosts[index] = post.copyWith(likes: post.likes + 1);
    }
  }

  void addComment(int index) {
    if (index >= 0 && index < allPosts.length) {
      final post = allPosts[index];
      allPosts[index] = post.copyWith(comments: post.comments + 1);
    }
  }

  void sharePost(int index) {
    if (index >= 0 && index < allPosts.length) {
      final post = allPosts[index];
      allPosts[index] = post.copyWith(shares: post.shares + 1);
    }
  }

  void addNewPost(AllPosts post) {
    allPosts.insert(0, post);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
