part of 'models.dart';
class Video{
  final String name;
  final String url;
  final String thumbnail;

  const Video({
    required this.name,
    required this.url,
    required this.thumbnail,
});
}
 const videos = [
   Video(
     name: 'museum 1',
     url: 'https://assets.mixkit.co/videos/preview/mixkit-contemporary-performance-of-a-dancer-with-light-on-her-chest-48189-large.mp4',
     thumbnail: 'https://assets.simpleviewinc.com/simpleview/image/upload/crm/muskegonmi/L-Muskegon-Musem-of-Art-Minotaur-3-_10ED39C2-5056-A36F-233DD5BD4CB82E6D-10ed32915056a36_10ed570e-5056-a36f-23ef6979cddc4049.jpg'
   ),
   Video(
       name: 'museum 2',
       url: 'https://assets.mixkit.co/videos/preview/mixkit-people-pouring-a-warm-drink-around-a-campfire-513-large.mp4',
       thumbnail: 'https://www.britishmuseum.org/sites/default/files/styles/16_9_media_small/public/2021-05/Room_62_British_Museum_Egyptian_mummies.jpg?h=3c92fe6b&itok=MTYedJs4'
   ),
   Video(
       name: 'museum 3',
       url: 'https://assets.mixkit.co/videos/preview/mixkit-waves-coming-to-the-beach-5016-large.mp4',
       thumbnail: 'https://www.britishmuseum.org/sites/default/files/styles/uncropped_large/public/2019-10/Visiting-Parthenon-gallery-british-museum.jpg?itok=1CLyjIZw'
   ),

 ];