import 'package:json_annotation/json_annotation.dart';
part 'video_view_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VideoViewModel {
  dynamic thumbnail;
  dynamic id;
  dynamic title;
  dynamic dateAndTime;
  dynamic slug;
  dynamic createdAt;
  dynamic manifest;
  dynamic liveStatus;
  dynamic liveManifest;
  dynamic isLive;
  dynamic channelImage;
  dynamic channelName;
  dynamic channelUsername;
  dynamic isVerified;
  dynamic channelSlug;
  dynamic channelSubscriber;
  dynamic channelId;
  dynamic type;
  dynamic viewers;
  dynamic duration;

  VideoViewModel({
    this.thumbnail,
    this.id,
    this.title,
    this.dateAndTime,
    this.slug,
    this.createdAt,
    this.manifest,
    this.liveStatus,
    this.liveManifest,
    this.isLive,
    this.channelImage,
    this.channelName,
    this.channelUsername,
    this.isVerified,
    this.channelSlug,
    this.channelSubscriber,
    this.channelId,
    this.type,
    this.viewers,
    this.duration,
  });

  VideoViewModel copyWith({
    dynamic thumbnail,
    dynamic id,
    dynamic title,
    dynamic dateAndTime,
    dynamic slug,
    dynamic createdAt,
    dynamic manifest,
    dynamic liveStatus,
    dynamic liveManifest,
    dynamic isLive,
    dynamic channelImage,
    dynamic channelName,
    dynamic channelUsername,
    dynamic isVerified,
    dynamic channelSlug,
    dynamic channelSubscriber,
    dynamic channelId,
    dynamic type,
    dynamic viewers,
    dynamic duration,
  }) =>
      VideoViewModel(
        thumbnail: thumbnail ?? this.thumbnail,
        id: id ?? this.id,
        title: title ?? this.title,
        dateAndTime: dateAndTime ?? this.dateAndTime,
        slug: slug ?? this.slug,
        createdAt: createdAt ?? this.createdAt,
        manifest: manifest ?? this.manifest,
        liveStatus: liveStatus ?? this.liveStatus,
        liveManifest: liveManifest ?? this.liveManifest,
        isLive: isLive ?? this.isLive,
        channelImage: channelImage ?? this.channelImage,
        channelName: channelName ?? this.channelName,
        channelUsername: channelUsername ?? this.channelUsername,
        isVerified: isVerified ?? this.isVerified,
        channelSlug: channelSlug ?? this.channelSlug,
        channelSubscriber: channelSubscriber ?? this.channelSubscriber,
        channelId: channelId ?? this.channelId,
        type: type ?? this.type,
        viewers: viewers ?? this.viewers,
        duration: duration ?? this.duration,
      );

  factory VideoViewModel.fromJson(Map<String, dynamic> json) =>
      _$VideoViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoViewModelToJson(this);
}
