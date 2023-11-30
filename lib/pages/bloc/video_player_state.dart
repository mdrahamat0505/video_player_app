// part of 'video_player_bloc.dart';
//
// class VideoPlayerState extends Equatable {
//   final List<VideoViewModel>? videoViewModel;
//  final FormzSubmissionStatus status;
//  final bool showSpinner ;
//
//   const VideoPlayerState({
//     this.videoViewModel = const[],
//     this.status =  FormzSubmissionStatus.initial,
//     this.showSpinner = false,
//   });
//
//   VideoPlayerState copyWith({
//     List<VideoViewModel>? videoViewModel,
//     FormzSubmissionStatus? status,
//     bool? showSpinner,
//
//   }) {
//     return VideoPlayerState(
//       videoViewModel: videoViewModel ?? this.videoViewModel,
//       status: status ?? this.status,
//       showSpinner: showSpinner ?? this.showSpinner,
//     );
//   }
//
//   @override
//   List<dynamic> get props => [
//     videoViewModel,
//     status,
//     showSpinner,
//   ];
// }