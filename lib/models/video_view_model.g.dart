// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoViewModel _$VideoViewModelFromJson(Map<String, dynamic> json) =>
    VideoViewModel(
      thumbnail: json['thumbnail'] as String?,
      id: json['id'],
      title: json['title'],
      dateAndTime: json['date_and_time'],
      slug: json['slug'],
      createdAt: json['created_at'],
      manifest: json['manifest'],
      liveStatus: json['live_status'],
      liveManifest: json['live_manifest'],
      isLive: json['is_live'],
      channelImage: json['channel_image'],
      channelName: json['channel_name'],
      channelUsername: json['channel_username'],
      isVerified: json['is_verified'] as bool?,
      channelSlug: json['channel_slug'],
      channelSubscriber: json['channel_subscriber'],
      channelId: json['channel_id'],
      type: json['type'],
      viewers: json['viewers'],
      duration: json['duration'],
    );

Map<String, dynamic> _$VideoViewModelToJson(VideoViewModel instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'id': instance.id,
      'title': instance.title,
      'date_and_time': instance.dateAndTime,
      'slug': instance.slug,
      'created_at': instance.createdAt,
      'manifest': instance.manifest,
      'live_status': instance.liveStatus,
      'live_manifest': instance.liveManifest,
      'is_live': instance.isLive,
      'channel_image': instance.channelImage,
      'channel_name': instance.channelName,
      'channel_username': instance.channelUsername,
      'is_verified': instance.isVerified,
      'channel_slug': instance.channelSlug,
      'channel_subscriber': instance.channelSubscriber,
      'channel_id': instance.channelId,
      'type': instance.type,
      'viewers': instance.viewers,
      'duration': instance.duration,
    };
