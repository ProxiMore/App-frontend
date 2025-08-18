import '../models/Post.dart';
import '../models/User.dart';
import 'package:proximore/models/Album.dart';

class Data {
  static List<Post> posts = [
    Post(
      title: "titre",
      content: 'Ceci est un exemple de post.',
      user: User(
        username: '@exemple_user',
        profileImage: 'assets/images/profile6.jpeg',
        profilePictureUri: 'assets/images/profile6.jpeg',
      ),
      created_at: DateTime.now(),
      tags: '#exemple',
    ),
    Post(
      title: "titre",
      content: 'Unleashing the beats with some electrifying tunes!',
      user: User(
        username: 'dj_electro_pulse',
        profileImage: 'assets/images/profile7.jpeg',
        profilePictureUri: 'assets/images/profile7.jpeg',
      ),
      created_at: DateTime.now(),
      tags: '#electro',
    ),
    Post(
      title: "titre",
      content: 'Rocking out with some classic vibes!',
      user: User(
        username: 'rocker_marc',
        profileImage: 'assets/images/profile10.jpg',
        profilePictureUri: 'assets/images/profile10.jpg',
      ),
      created_at: DateTime.now(),
      tags: '#rock',
    ),
    Post(
      title: "titre",
      content:
          "Session acoustique improvisée dans mon jardin. La musique au naturel, ça n'a pas de prix.",
      user: User(
        username: 'acoustic_lisa',
        profileImage: 'assets/images/profile5.png',
        profilePictureUri: 'assets/images/profile5.png',
      ),
      created_at: DateTime.now(),
      tags: '#acoustic',
    ),
    Post(
      title: "titre",
      content:
          "Le nouveau clip de mon groupe de métal est enfin disponible ! Préparez-vous à headbanger !",
      user: User(
        username: 'metal_max',
        profileImage: 'assets/images/profile1.png',
        profilePictureUri: 'assets/images/profile1.png',
      ),
      created_at: DateTime.now(),
      tags: '#metal',
    ),
    Post(
      title: "titre",
      content:
          "Balade en forêt et inspiration musicale. La nature est ma plus grande source d'inspiration.",
      user: User(
        username: 'folk_charlie',
        profileImage: 'assets/images/profile3.jpg',
        profilePictureUri: 'assets/images/profile3.jpg',
      ),
      created_at: DateTime.now(),
      tags: '#folk',
    ),
    Post(
      title: "titre",
      content:
          "Nouveau single disponible sur toutes les plateformes ! J'espère qu'il vous plaira autant qu'à moi.",
      user: User(
        username: 'pop_emma',
        profileImage: 'assets/images/profile2.jpeg',
        profilePictureUri: 'assets/images/profile2.jpeg',
      ),
      created_at: DateTime.now(),
      tags: '#pop',
    ),
    Post(
      title: "titre",
      content:
          "Nouveau single disponible sur toutes les plateformes ! J'espère qu'il vous plaira autant qu'à moi.",
      user: User(
        username: 'reggae_tom',
        profileImage: 'assets/images/profile11.jpg',
        profilePictureUri: 'assets/images/profile11.jpg',
      ),
      created_at: DateTime.now(),
      tags: '#pop',
    ),
  ];

  static List<Album> albums = [
    Album(
      id: 1,
      title: 'So Close To What',
      author: 'Tate McRae',
      mediaUri: 'assets/images/album1.jpeg',
    ),
    Album(
      id: 2,
      title: 'TOO YOUNG TO BE SAD',
      author: 'Tate McRae',
      mediaUri: 'assets/images/album2.jpg',
    ),
    Album(
      id: 3,
      title: 'All The Things I Never Said',
      author: 'Tate McRae',
      mediaUri: 'assets/images/album3.jpg',
    ),
    Album(
      id: 4,
      title: 'THINK LATER',
      author: 'Tate McRae',
      mediaUri: 'assets/images/album4.jpg',
    ),
    Album(
      id: 5,
      title: 'Sour',
      author: 'Olivia Rodrigo',
      mediaUri: 'assets/images/album5.jpg',
    ),
    Album(
      id: 6,
      title: 'Future Nostalgia',
      author: 'Dua Lipa',
      mediaUri: 'assets/images/album6.jpg',
    ),
    Album(
      id: 7,
      title: 'After Hours',
      author: 'The Weekend',
      mediaUri: 'assets/images/album7.jpg',
    ),
    Album(
      id: 8,
      title: 'Planet Her',
      author: 'Doja Cat',
      mediaUri: 'assets/images/album8.jpg',
    ),
    Album(
      id: 9,
      title: '30',
      author: 'Adele',
      mediaUri: 'assets/images/album9.jpg',
    ),
    Album(
      id: 10,
      title: 'Montero',
      author: 'Lil Nas X',
      mediaUri: 'assets/images/album10.jpg',
    ),
    Album(
      id: 11,
      title: 'Happier Than Ever',
      author: 'Billie Eilish',
      mediaUri: 'assets/images/album11.jpg',
    ),
    Album(
      id: 12,
      title: 'Certified Lover Boy',
      author: 'Drake',
      mediaUri: 'assets/images/album12.jpg',
    ),
    Album(
      id: 13,
      title: 'Donda',
      author: 'Kanye West',
      mediaUri: 'assets/images/album13.jpg',
    ),
    Album(
      id: 14,
      title: 'Justice',
      author: 'Justin Bieber',
      mediaUri: 'assets/images/album14.jpg',
    ),
    Album(
      id: 15,
      title: 'Positions',
      author: 'Ariana Grande',
      mediaUri: 'assets/images/album15.jpg',
    ),
    Album(
      id: 16,
      title: 'Folklore',
      author: 'Taylor Swift',
      mediaUri: 'assets/images/album16.jpg',
    ),
    Album(
      id: 17,
      title: 'Fine Line',
      author: 'Harry Styles',
      mediaUri: 'assets/images/album17.jpg',
    ),
    Album(
      id: 18,
      title: 'When We All Fall Asleep, Where Do We Go?',
      author: 'Billie Eilish',
      mediaUri: 'assets/images/album18.jpg',
    ),
    Album(
      id: 19,
      title: "Hollywood's Bleeding",
      author: 'Post Malone',
      mediaUri: 'assets/images/album19.jpg',
    ),
    Album(
      id: 20,
      title: 'Thank U, Next',
      author: 'Ariana Grande',
      mediaUri: 'assets/images/album20.jpg',
    ),
  ];

  static List<String> audioFiles = [
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3",
  ];
}
