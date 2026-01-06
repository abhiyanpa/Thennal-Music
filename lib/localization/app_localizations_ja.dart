// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get about => 'アプリの情報';

  @override
  String get accentChangeMsg => '差し色を変更しました';

  @override
  String get accentColor => '差し色';

  @override
  String get add => '追加';

  @override
  String get addPlaylist => 'Add playlist';

  @override
  String get addToLikedPlaylists => 'いいねした再生リストに追加';

  @override
  String get addToLikedSongs => 'いいねした曲に追加';

  @override
  String get addToPlaylist => '再生リストに追加';

  @override
  String get addToQueue => 'Add to queue';

  @override
  String get addedPlaylists => '追加済みの再生リスト';

  @override
  String get addedSuccess => '追加しました';

  @override
  String get addedToLikedSongs => 'Added to liked songs';

  @override
  String get album => 'アルバム';

  @override
  String get albums => 'アルバム';

  @override
  String get alreadyDownloading => 'すでにダウンロード中';

  @override
  String get appUpdateIsAvailable => 'アプリの最新版があります';

  @override
  String get artist => 'アーティスト';

  @override
  String get audioQuality => '音質';

  @override
  String get audioQualityHigh => 'High';

  @override
  String get audioQualityLow => 'Low';

  @override
  String get audioQualityMedium => 'Medium';

  @override
  String get audioQualityMsg => '音質を変更しました';

  @override
  String get audioQualityUltra => 'Ultra';

  @override
  String get audioQualityVeryHigh => 'Very High';

  @override
  String get automaticSongPicker => '自動で曲選択';

  @override
  String get automaticSongPickerDescription =>
      'Automatically play a random song after the current track ends.';

  @override
  String get automaticUpdateChecks => 'Automatic update checks';

  @override
  String get automaticUpdateChecksDescription =>
      'Automatically check for app updates on startup.';

  @override
  String get backToFavorites => 'お気に入りに戻す';

  @override
  String get backedupSuccess => 'データを正常にバックアップしました';

  @override
  String get backupError => 'データのバックアップ中にエラーが発生しました';

  @override
  String get backupUserData => 'ユーザーデータをバックアップ';

  @override
  String get becomeSponsor => '開発を支援';

  @override
  String get cacheMsg => 'キャッシュを消去しました';

  @override
  String get cancel => 'キャンセル';

  @override
  String get checkForUpdates => 'Check for Updates?';

  @override
  String get chooseBackupDir => 'バックアップ先のフォルダを選択';

  @override
  String get chooseBackupFiles => 'バックアップファイルを選択';

  @override
  String get clear => '消去';

  @override
  String get clearCache => 'キャッシュを削除';

  @override
  String get clearQueue => 'Clear queue';

  @override
  String get clearRecentlyPlayed => '再生履歴を削除';

  @override
  String get clearRecentlyPlayedQuestion => '再生履歴を削除しますか？';

  @override
  String get clearSearchHistory => '検索履歴を削除';

  @override
  String get clearSearchHistoryQuestion => '検索履歴を削除しますか？';

  @override
  String get confirm => '確認';

  @override
  String get confirmation => '確認';

  @override
  String get copyLogs => 'ログをコピー';

  @override
  String get copyLogsNoLogs => 'ログまだありません';

  @override
  String get copyLogsSuccess => 'ログをコピーしました';

  @override
  String get create => '作成';

  @override
  String get createFolder => 'フォルダーを作成';

  @override
  String get custom => 'Custom';

  @override
  String get customPlaylistImgUrl => 'リスト用の画像のリンク';

  @override
  String get customPlaylistName => 'リスト名の指定';

  @override
  String get customPlaylists => 'あなたの再生リスト';

  @override
  String get dateAdded => 'Date Added';

  @override
  String get default_ => 'Default';

  @override
  String get delete => '削除';

  @override
  String get deleteFolder => 'フォルダーを削除';

  @override
  String get deleteFolderQuestion =>
      'このフォルダーを削除しますか? 中身の再生リストは、メインのライブラリに移動されます。';

  @override
  String get deletePlaylist => '再生リストを削除';

  @override
  String get download => 'ダウンロード';

  @override
  String get downloadAppUpdate => 'アプリの最新版をダウンロード';

  @override
  String get downloadCancelled => 'ダウンロードをキャンセルしました';

  @override
  String get downloadFailed => 'ダウンロード失敗';

  @override
  String get downloadPlaylist => '再生リストをダウンロード';

  @override
  String get dynamicColor => '差し色を動的に変更 (Android 12以上)';

  @override
  String get editPlaylist => 'Edit playlist';

  @override
  String get emptyFolderMsg => 'このフォルダーは空です。再生リストを追加して好きな音楽を整理しよう。';

  @override
  String get enableUpdateChecksDescription =>
      'Would you like Thennal Music to check for updates automatically from GitHub releases? You can always check for updates manually from the settings';

  @override
  String get enterFolderName => 'フォルダー名を入力してください';

  @override
  String get error => '不明のエラーが発生';

  @override
  String get externalRecommendations => 'External recommendations';

  @override
  String get externalRecommendationsDescription =>
      'Use the external algorithm for recommendations instead of Thennal Music’s own.';

  @override
  String get fieldsNotEmpty => 'All fields must be filled';

  @override
  String get folderAlreadyExists => 'このフォルダー名は既にあります';

  @override
  String get folderDeleted => 'フォルダーを削除しました';

  @override
  String get folderName => 'フォルダー名';

  @override
  String get folderRestrictions =>
      'Androidの新しい制約により、ファイルの種類に対して適切なフォルダを選択する必要があります。本アプリのバックアップには、「Documents」か「Downloads」フォルダを必ず選択してください。';

  @override
  String get home => 'ホーム';

  @override
  String get hours => '時間';

  @override
  String get imagePicked => 'Image selected';

  @override
  String get invalidYouTubePlaylist => '無効な Youtube 再生リスト';

  @override
  String get language => '言語';

  @override
  String get languageMsg => '言語を変更しました';

  @override
  String get library => 'ライブラリ';

  @override
  String get licenses => 'ライセンス';

  @override
  String get likedPlaylists => 'いいねした再生リスト';

  @override
  String get likedSongs => 'いいねした曲';

  @override
  String get lyrics => '歌詞';

  @override
  String get lyricsNotAvailable => '歌詞は利用できません';

  @override
  String get makeOffline => 'オフラインで利用する';

  @override
  String get minutes => '分';

  @override
  String get moveToFolder => 'フォルダーに移動';

  @override
  String get name => '名前';

  @override
  String get newAnnouncement => '新しいお知らせを掲載';

  @override
  String get newFolder => '新規フォルダー';

  @override
  String get no => 'No';

  @override
  String get noCustomPlaylists => 'まだ再生リストを作成していません';

  @override
  String get noPlaylistsAdded => 'まだ再生リストは追加されていません';

  @override
  String get noSongsInQueue => 'キュー内に曲なし';

  @override
  String get notYTlist => '有効な YouTube の再生リスト ID ではありません';

  @override
  String get offlineMode => 'オフラインモード';

  @override
  String get offlineModeDescription =>
      'Disable online features and use Thennal Music completely offline.';

  @override
  String get offlinePlaylists => 'オフラインの再生リスト';

  @override
  String get offlineSongs => 'オフライン用の曲';

  @override
  String get others => 'ほか';

  @override
  String get pickImageFromDevice => '端末から画像を選択';

  @override
  String get playNext => '次に再生';

  @override
  String get playlist => '再生リスト';

  @override
  String get playlistAlreadyDownloaded => '再生リストは既にダウンロード済みです';

  @override
  String get playlistAlreadyExists => '再生リストは既に存在します';

  @override
  String get playlistDownloaded => 'ダウンロード済みの再生リスト';

  @override
  String get playlistEmpty => '再生リストはからです';

  @override
  String get playlistFolders => '再生リストのフォルダー';

  @override
  String get playlistRemovedFromOffline => 'オフライン用保存領域から再生リストを削除しました';

  @override
  String get playlistUpdated => '再生リストを更新しました';

  @override
  String get playlists => '再生リスト';

  @override
  String get predictiveBack => '予測的なバックアニメーションを使用 (Android 14以上)';

  @override
  String get preferences => '設定';

  @override
  String get provideIdOrNameError => 'YouTube のリストの ID か、リスト名を入力してください';

  @override
  String get pureBlackTheme => 'ピュアブラックを使用';

  @override
  String get queue => 'Queue';

  @override
  String get recentlyPlayed => '最近聴いた曲';

  @override
  String get recentlyPlayedMsg => '再生履歴を消去しました';

  @override
  String get recommendedForYou => 'あなたにおすすめ';

  @override
  String get remove => '削除';

  @override
  String get removeFromFolder => 'フォルダーから削除';

  @override
  String get removeFromLikedPlaylists => 'いいねした再生リストから削除';

  @override
  String get removeFromLikedSongs => 'いいねした曲から削除';

  @override
  String get removeFromPlaylist => '再生リストから削除';

  @override
  String get removeFromRecentlyPlayed => '最近聴いた曲から削除';

  @override
  String get removeOffline => 'オフラインから削除';

  @override
  String get removeOfflinePlaylist => 'オフライン再生リストから削除';

  @override
  String get removeOfflinePlaylistConfirm =>
      'オフライン用保存領域から再生リストを除去します。ほかの再生リストで使われている曲は利用できるまま残ります。';

  @override
  String get removePlaylistQuestion => 'この再生リストを削除しますか？';

  @override
  String get removeSearchQueryQuestion => 'この検索語句を削除しますか？';

  @override
  String get removedFromLikedSongs => 'Removed from liked songs';

  @override
  String get renameSong => 'Rename song';

  @override
  String get restoreError => 'データ復元中にエラーが発生しました';

  @override
  String get restoreUserData => 'ユーザーデータの復元';

  @override
  String get restoredSuccess => '復元に成功しました';

  @override
  String get search => '検索';

  @override
  String get searchHistoryMsg => '検索履歴を削除しました';

  @override
  String get selectDuration => '時間を選択';

  @override
  String get setSleepTimer => 'スリープタイマーを設定';

  @override
  String get setTimer => 'タイマーを設定';

  @override
  String get settingChangedMsg => '設定を変更しました';

  @override
  String get settings => '設定';

  @override
  String get sleepTimerCancelled => 'スリープタイマーをキャンセルしました';

  @override
  String get sleepTimerSet => 'スリープタイマーを設定';

  @override
  String get songAdded => '曲を追加しました';

  @override
  String get songAddedToOffline => '曲がオフラインで利用可能になりました';

  @override
  String get songAlreadyInPlaylist => '曲は既に再生リストに含まれます';

  @override
  String get songRemoved => '曲を除去しました';

  @override
  String get songRemovedFromOffline => '曲をオフラインで利用できなくしました';

  @override
  String get songs => '曲';

  @override
  String get sponsorBlockDescription =>
      'Skip sponsored segments in supported tracks.';

  @override
  String get sponsorProject => 'このプロジェクトを支援';

  @override
  String get suggestedArtists => 'おすすめアーティスト';

  @override
  String get suggestedPlaylists => 'おすすめ再生リスト';

  @override
  String get tapToView => 'Tap to view';

  @override
  String get themeMode => 'テーマ';

  @override
  String get themeModeDark => 'Dark';

  @override
  String get themeModeLight => 'Light';

  @override
  String get themeModeSystem => 'System';

  @override
  String get tools => 'ツール';

  @override
  String get translate => 'Translate';

  @override
  String get translateDescription =>
      'Help translate Thennal Music into your language on Crowdin.';

  @override
  String get understand => '理解しました';

  @override
  String get undo => '元に戻す';

  @override
  String get update => '更新';

  @override
  String get useProxy => 'Use proxy';

  @override
  String get useProxyDescription =>
      'Use the proxy only when streaming fails, unnecessary use may break playback.';

  @override
  String get userPlaylists => '再生リスト';

  @override
  String get yes => 'Yes';

  @override
  String get youtubePlaylistLinkOrId => 'YouTube 再生リストのリンクかID ';
}
