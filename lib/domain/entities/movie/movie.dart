import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

// ignore_for_file: non_constant_identifier_names

@JsonSerializable()
class Movie {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'backdrop_path')
  final String? backdrop_path;

  @JsonKey(name: 'genre_ids')
  final List<int>? genre_ids;

  @JsonKey(name: 'adult')
  final bool? adult;

  @JsonKey(name: 'original_language')
  final String? original_language;

  @JsonKey(name: 'original_title')
  final String? original_title;

  @JsonKey(name: 'overview')
  final String? overview;

  @JsonKey(name: 'popularity')
  final double? popularity;

  @JsonKey(name: 'poster_path')
  final String? poster_path;

  @JsonKey(name: 'release_date')
  final String? release_date;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'video')
  final bool? video;

  @JsonKey(name: 'vote_average')
  final double? vote_average;

  @JsonKey(name: 'vote_count')
  final int? vote_count;

  Movie(
      {this.id,
      this.backdrop_path,
      this.genre_ids,
      this.adult,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.release_date,
      this.title,
      this.video,
      this.vote_average,
      this.vote_count});

  factory Movie.empty() => Movie();

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

// class Post {
//   final String id;
//   final int? userId;
//   final String? title;
//   final bool? completed;

//   Post({
//     required this.id,
//     this.userId,
//     this.title,
//     this.completed,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'].toString(),
//       userId: json['userId'] ?? 0,
//       title: json['title'] ?? '',
//       completed: json['completed'] ?? '',
//     );
//   }
// }

var res = {
  "dates": {"maximum": "2024-01-17", "minimum": "2023-12-27"},
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/bckxSN9ueOgm0gJpVJmPQrecWul.jpg",
      "genre_ids": [28, 12, 14],
      "id": 572802,
      "original_language": "en",
      "original_title": "Aquaman and the Lost Kingdom",
      "overview":
          "Black Manta, still driven by the need to avenge his father's death and wielding the power of the mythic Black Trident, will stop at nothing to take Aquaman down once and for all. To defeat him, Aquaman must turn to his imprisoned brother Orm, the former King of Atlantis, to forge an unlikely alliance in order to save the world from irreversible destruction.",
      "popularity": 1891.141,
      "poster_path": "/8xV47NDrjdZDpkVcCFqkdHa3T0C.jpg",
      "release_date": "2023-12-20",
      "title": "Aquaman and the Lost Kingdom",
      "video": false,
      "vote_average": 6.573,
      "vote_count": 89
    },
    {
      "adult": false,
      "backdrop_path": "/k1KrbaCMACQiq7EA0Yhw3bdzMv7.jpg",
      "genre_ids": [16, 10751, 10402, 14, 35],
      "id": 901362,
      "original_language": "en",
      "original_title": "Trolls Band Together",
      "overview":
          "When Branch's brother, Floyd, is kidnapped for his musical talents by a pair of nefarious pop-star villains, Branch and Poppy embark on a harrowing and emotional journey to reunite the other brothers and rescue Floyd from a fate even worse than pop-culture obscurity.",
      "popularity": 605.385,
      "poster_path": "/bkpPTZUdq31UGDovmszsg2CchiI.jpg",
      "release_date": "2023-10-12",
      "title": "Trolls Band Together",
      "video": false,
      "vote_average": 7.149,
      "vote_count": 399
    },
    {
      "adult": false,
      "backdrop_path": "/fm6KqXpk3M2HVveHwCrBSSBaO0V.jpg",
      "genre_ids": [18, 36],
      "id": 872585,
      "original_language": "en",
      "original_title": "Oppenheimer",
      "overview":
          "The story of J. Robert Oppenheimer's role in the development of the atomic bomb during World War II.",
      "popularity": 611.128,
      "poster_path": "/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
      "release_date": "2023-07-19",
      "title": "Oppenheimer",
      "video": false,
      "vote_average": 8.128,
      "vote_count": 5539
    },
    {
      "adult": false,
      "backdrop_path": "/bWIIWhnaoWx3FTVXv6GkYDv3djL.jpg",
      "genre_ids": [878, 27, 28],
      "id": 940721,
      "original_language": "ja",
      "original_title": "ゴジラ-1.0",
      "overview":
          "In postwar Japan, a new terror rises. Will the devastated people be able to survive... let alone fight back?",
      "popularity": 307.176,
      "poster_path": "/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg",
      "release_date": "2023-11-03",
      "title": "Godzilla Minus One",
      "video": false,
      "vote_average": 8.022,
      "vote_count": 162
    },
    {
      "adult": false,
      "backdrop_path": "/ktHEdqmMWC1wdfPRMRCTZe2OISL.jpg",
      "genre_ids": [27, 53, 9648],
      "id": 1071215,
      "original_language": "en",
      "original_title": "Thanksgiving",
      "overview":
          "After a Black Friday riot ends in tragedy, a mysterious Thanksgiving-inspired killer terrorizes Plymouth, Massachusetts - the birthplace of the holiday. Picking off residents one by one, what begins as random revenge killings are soon revealed to be part of a larger, sinister holiday plan.",
      "popularity": 499.897,
      "poster_path": "/f5f3TEVst1nHHyqgn7Z3tlwnBIH.jpg",
      "release_date": "2023-11-16",
      "title": "Thanksgiving",
      "video": false,
      "vote_average": 6.657,
      "vote_count": 197
    },
    {
      "adult": false,
      "backdrop_path": "/gg4zZoTggZmpAQ32qIrP5dtnkEZ.jpg",
      "genre_ids": [28, 80, 53],
      "id": 891699,
      "original_language": "en",
      "original_title": "Silent Night",
      "overview":
          "A tormented father witnesses his young son die when caught in a gang's crossfire on Christmas Eve. While recovering from a wound that costs him his voice, he makes vengeance his life's mission and embarks on a punishing training regimen in order to avenge his son's death.",
      "popularity": 484.673,
      "poster_path": "/tlcuhdNMKNGEVpGqBZrAaOOf1A6.jpg",
      "release_date": "2023-11-30",
      "title": "Silent Night",
      "video": false,
      "vote_average": 5.9,
      "vote_count": 100
    },
    {
      "adult": false,
      "backdrop_path": "/ptz5ETMxDoRRiE69BVuIxJzyTEO.jpg",
      "genre_ids": [16, 35, 12, 10751],
      "id": 940551,
      "original_language": "en",
      "original_title": "Migration",
      "overview":
          "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.",
      "popularity": 309.179,
      "poster_path": "/kJG74Y1RxLLjRLYOTrBclWpbvkz.jpg",
      "release_date": "2023-12-06",
      "title": "Migration",
      "video": false,
      "vote_average": 7.342,
      "vote_count": 38
    },
    {
      "adult": false,
      "backdrop_path": "/ehumsuIBbgAe1hg343oszCLrAfI.jpg",
      "genre_ids": [16, 10751, 14, 12],
      "id": 1022796,
      "original_language": "en",
      "original_title": "Wish",
      "overview":
          "Asha, a sharp-witted idealist, makes a wish so powerful that it is answered by a cosmic force – a little ball of boundless energy called Star. Together, Asha and Star confront a most formidable foe - the ruler of Rosas, King Magnifico - to save her community and prove that when the will of one courageous human connects with the magic of the stars, wondrous things can happen.",
      "popularity": 264.413,
      "poster_path": "/AcoVfiv1rrWOmAdpnAMnM56ki19.jpg",
      "release_date": "2023-11-13",
      "title": "Wish",
      "video": false,
      "vote_average": 6.55,
      "vote_count": 140
    },
    {
      "adult": false,
      "backdrop_path": "/mowTk9LFSr8rW3EG2CUSwzuvx0g.jpg",
      "genre_ids": [10402],
      "id": 1160164,
      "original_language": "en",
      "original_title": "TAYLOR SWIFT | THE ERAS TOUR",
      "overview":
          "The cultural phenomenon continues on the big screen! Immerse yourself in this once-in-a-lifetime concert film experience with a breathtaking, cinematic view of the history-making tour.",
      "popularity": 188.151,
      "poster_path": "/jf3YO8hOqGHCupsREf5qymYq1n.jpg",
      "release_date": "2023-10-13",
      "title": "TAYLOR SWIFT | THE ERAS TOUR",
      "video": false,
      "vote_average": 8.307,
      "vote_count": 176
    },
    {
      "adult": false,
      "backdrop_path": "/lyHmhoRj3zXSdeCYbs2oOXLCF4K.jpg",
      "genre_ids": [16, 12, 10751, 14],
      "id": 459003,
      "original_language": "uk",
      "original_title": "Мавка: Лісова пісня",
      "overview":
          "Forest soul Mavka faces an impossible choice between her heart and her duty as guardian to the Heart of the Forest, when she falls in love with the talented young human musician Lukas.",
      "popularity": 171.313,
      "poster_path": "/eeJjd9JU2Mdj9d7nWRFLWlrcExi.jpg",
      "release_date": "2023-03-02",
      "title": "Mavka: The Forest Song",
      "video": false,
      "vote_average": 7.326,
      "vote_count": 553
    },
    {
      "adult": false,
      "backdrop_path": "/iEFuHjqrE059SmflBva1JzDJutE.jpg",
      "genre_ids": [16, 14, 28, 10749, 10751],
      "id": 496450,
      "original_language": "fr",
      "original_title": "Miraculous - le film",
      "overview":
          "A life of an ordinary Parisian teenager Marinette goes superhuman when she becomes Ladybug. Bestowed with magical powers of creation, Ladybug must unite with her opposite, Cat Noir, to save Paris as a new villain unleashes chaos unto the city.",
      "popularity": 147.536,
      "poster_path": "/dQNJ8SdCMn3zWwHzzQD2xrphR1X.jpg",
      "release_date": "2023-07-05",
      "title": "Miraculous: Ladybug & Cat Noir, The Movie",
      "video": false,
      "vote_average": 7.791,
      "vote_count": 689
    },
    {
      "adult": false,
      "backdrop_path": "/p9DKeXp6FPJtAQ1k13Z4zPWrCbN.jpg",
      "genre_ids": [18],
      "id": 1058694,
      "original_language": "en",
      "original_title": "Radical",
      "overview":
          "In a Mexican border town plagued by neglect, corruption, and violence, a frustrated teacher tries a radical new method to break through his students’ apathy and unlock their curiosity, their potential… and maybe even their genius.",
      "popularity": 131.589,
      "poster_path": "/eSatbygYZp8ooprBHZdb6GFZxGB.jpg",
      "release_date": "2023-10-19",
      "title": "Radical",
      "video": false,
      "vote_average": 7.6,
      "vote_count": 13
    },
    {
      "adult": false,
      "backdrop_path": "/a0GM57AnJtNi7lMOCamniiyV10W.jpg",
      "genre_ids": [16, 12, 14, 18],
      "id": 508883,
      "original_language": "ja",
      "original_title": "君たちはどう生きるか",
      "overview":
          "While the Second World War rages, the teenage Mahito, haunted by his mother's tragic death, is relocated from Tokyo to the serene rural home of his new stepmother Natsuko, a woman who bears a striking resemblance to the boy's mother. As he tries to adjust, this strange new world grows even stranger following the appearance of a persistent gray heron, who perplexes and bedevils Mahito, dubbing him the \"long-awaited one.\"",
      "popularity": 101.215,
      "poster_path": "/jDQPkgzerGophKRRn7MKm071vCU.jpg",
      "release_date": "2023-07-14",
      "title": "The Boy and the Heron",
      "video": false,
      "vote_average": 7.3,
      "vote_count": 291
    },
    {
      "adult": false,
      "backdrop_path": "/8RBwd37p2p48lUmZuWBLSkFLprd.jpg",
      "genre_ids": [27, 53, 35],
      "id": 1113278,
      "original_language": "en",
      "original_title": "It's a Wonderful Knife",
      "overview":
          "Winnie's life is less than wonderful one year after saving her town from a psychotic killer on Christmas Eve. When she wishes she was never born, she finds herself magically transported to a nightmarish parallel universe. With the murderous maniac now back, she must team up with a misfit to identify the culprit and get back to her own reality.",
      "popularity": 96.991,
      "poster_path": "/bnm5NntrQBcG3P7DbO00v2FmXm8.jpg",
      "release_date": "2023-11-10",
      "title": "It's a Wonderful Knife",
      "video": false,
      "vote_average": 5.288,
      "vote_count": 40
    },
    {
      "adult": false,
      "backdrop_path": "/hXvx5YJbexKxsVD1NTEARObSnt2.jpg",
      "genre_ids": [35, 10749],
      "id": 1072790,
      "original_language": "en",
      "original_title": "Anyone But You",
      "overview":
          "After an amazing first date, Bea and Ben's fiery attraction turns ice cold — until they find themselves unexpectedly reunited at a destination wedding in Australia. So they do what any two mature adults would do: pretend to be a couple.",
      "popularity": 113.723,
      "poster_path": "/yRt7MGBElkLQOYRvLTT1b3B1rcp.jpg",
      "release_date": "2023-12-21",
      "title": "Anyone But You",
      "video": false,
      "vote_average": 9.5,
      "vote_count": 3
    },
    {
      "adult": false,
      "backdrop_path": "/50stq3Jlny6oEgJjsXbQvbajCNw.jpg",
      "genre_ids": [18, 10749],
      "id": 1020006,
      "original_language": "en",
      "original_title": "Priscilla",
      "overview":
          "When teenage Priscilla Beaulieu meets Elvis Presley at a party, the man who is already a meteoric rock-and-roll superstar becomes someone entirely unexpected in private moments: a thrilling crush, an ally in loneliness, a vulnerable best friend.",
      "popularity": 102.493,
      "poster_path": "/uDCeELWWpsNq7ErM61Yuq70WAE9.jpg",
      "release_date": "2023-10-27",
      "title": "Priscilla",
      "video": false,
      "vote_average": 7.045,
      "vote_count": 77
    },
    {
      "adult": false,
      "backdrop_path": "/kszooR7v1TLFM4pzx6IkKq2jDAN.jpg",
      "genre_ids": [18, 9648],
      "id": 915935,
      "original_language": "fr",
      "original_title": "Anatomie d'une chute",
      "overview":
          "A woman is suspected of her husband’s murder, and their blind son faces a moral dilemma as the sole witness.",
      "popularity": 111.903,
      "poster_path": "/kQs6keheMwCxJxrzV83VUwFtHkB.jpg",
      "release_date": "2023-08-23",
      "title": "Anatomy of a Fall",
      "video": false,
      "vote_average": 7.744,
      "vote_count": 443
    },
    {
      "adult": false,
      "backdrop_path": "/jBOyi3ibJbVa1imTCcddPUxTVAV.jpg",
      "genre_ids": [35, 27, 14],
      "id": 956920,
      "original_language": "no",
      "original_title": "There's Something in the Barn",
      "overview":
          "An American family fulfills their dream of moving back to their roots after inheriting a remote cabin in the mountains of Norway. But there's a surprise waiting for them.",
      "popularity": 84.139,
      "poster_path": "/axrzMJR5VPWYNiW9ArENiMEPTjr.jpg",
      "release_date": "2023-11-02",
      "title": "There's Something in the Barn",
      "video": false,
      "vote_average": 7.078,
      "vote_count": 58
    },
    {
      "adult": false,
      "backdrop_path": "/sQLMaESdeELB7Dl8HdxfGlZYRzu.jpg",
      "genre_ids": [35, 18],
      "id": 840430,
      "original_language": "en",
      "original_title": "The Holdovers",
      "overview":
          "A curmudgeonly instructor at a New England prep school is forced to remain on campus during Christmas break to babysit the handful of students with nowhere to go. Eventually, he forms an unlikely bond with one of them — a damaged, brainy troublemaker — and with the school’s head cook, who has just lost a son in Vietnam.",
      "popularity": 78.255,
      "poster_path": "/VHSzNBTwxV8vh7wylo7O9CLdac.jpg",
      "release_date": "2023-10-27",
      "title": "The Holdovers",
      "video": false,
      "vote_average": 7.68,
      "vote_count": 175
    },
    {
      "adult": false,
      "backdrop_path": "/gsVC7HMf4VR2XFOyqjTSklY2Tms.jpg",
      "genre_ids": [878, 35, 18],
      "id": 792307,
      "original_language": "en",
      "original_title": "Poor Things",
      "overview":
          "Brought back to life by an unorthodox scientist, a young woman runs off with a debauched lawyer on a whirlwind adventure across the continents. Free from the prejudices of her times, she grows steadfast in her purpose to stand for equality and liberation.",
      "popularity": 100.638,
      "poster_path": "/mPdeQ1H6IXDAXtwQ2EdQuSCNmwV.jpg",
      "release_date": "2023-12-07",
      "title": "Poor Things",
      "video": false,
      "vote_average": 8.7,
      "vote_count": 19
    }
  ],
  "total_pages": 29,
  "total_results": 571
};
