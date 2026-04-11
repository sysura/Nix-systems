{config, pkgs, lib, ... }:


{
  programs.freetube = {
    enable = true;
    settings = {
      baseTheme = "catppuccinMocha";
      mainColor = "catppucinMochaFlamingo";
      secColor = "catppuccinMochaSapphire";
      barColor = false;

      checkForUpdates = false;
      enableScreenshot = true;
      enableSearchSuggestions = false;
      expandSideBar = false;

      hideChannelCommunity = true;
      hideChannelCourses = true;
      hideChannelPodcasts = true;
      hideChannelReleases = true;
      hideChannelShorts = true;
      hideChannelSubscriptions = true;
      hideCommentLikes = true;
      hideCommentPhotos = true;
      hideFeaturedChannels = true;
      hideHeaderLogo = true;
      hideLabelsSideBar = true;
      hideLiveChat = true;
      hideLiveStreams = true;
      hideRecommendedVideos = true;
      hideSubscriptionsCommunity = true;
      hideSubscriptionsShorts = true;
      hideTrendingVideos = true;
      hideUpcomingPremieres = true;
      hideVideoLikesAndDislikes = true;
      hideVideoViews = true;

      playNextVideo = false;
      rememberSearchHistory = false;
      saveVideoHistoryWithLastViewedPlaylist = false;
      screenshotAskPath = false;
      screenshotFolderPath = "~/Pictures/Screenshots";

      showDistractionFreeTitles = true;
      sponsorBlockFiller = {
        color = "CatppuccinMochaLavender";
        skip = "showInSeekBar";
      };
      sponsorBlockInteraction = {
        color = "CatppuccinMochaRed";
        skip = "autoSkip";
      };
      sponsorBlockMusicOffTopic = {
        color = "CatppuccinMochaTeal";
        skip = "showInSeekBar";
      };
      sponsorBlockRecap = {
        color = "CatppuccinFrappeBlue";
        skip = "showInSeekBar";
      };
      sponsorBlockSelfPromo = {
        color = "CatppuccinMochaYellow";
        skip = "autoSkip";
      };
      sponsorBlockSponsor = {
        color = "CatppuccinMochaGreen";
        skip = "autoSkip";
      };
      useDeArrowThumbnails = true;
      useDeArrowTitles = true;
      useRssFeeds = true;
      useSponsorBlock = true;
    };
  };
}
