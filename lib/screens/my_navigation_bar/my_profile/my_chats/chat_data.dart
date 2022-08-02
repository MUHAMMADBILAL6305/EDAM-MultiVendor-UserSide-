class ChatModel {
  String profileName, lastMessage, profileImagePath,messageTime;
  bool isOnline, isTextRead;

  ChatModel(this.profileName, this.lastMessage, this.profileImagePath,this.messageTime,
      {this.isOnline = false, this.isTextRead = false});
}

List<ChatModel> myChatsDummyData = [
  ChatModel(
      'Lesbi Meri',
      'Perfect',
      'assets/images/profile.jpg',
      '13:03',
      isOnline: true,
      isTextRead: false),
  ChatModel(
      'Sergio Pro',
      'Greating dear',
      'assets/images/profile1.jpg',
      '17:37',
      isOnline: false,
      isTextRead: false),
  ChatModel(
      'John Sake',
      'Thanks alot dear for kindness',
      'assets/images/profile2.jpg',
      '17:30',
      isOnline: true,
      isTextRead: true),
  ChatModel(
      'Melissa Ramos',
      'See you Monday morning!',
      'assets/images/profile3.jpg',
      '17:26',
      isOnline: false,
      isTextRead: false),
  ChatModel(
      'Florian Marcu',
      'Thanks a lot for the tip',
      'assets/images/profile4.jpg',
      '17:21',
      isOnline: false,
      isTextRead: true),
  ChatModel(
      'Gail Stone',
      'No worries, thank you!',
      'assets/images/profile5.jpg',
      '16:45',
      isOnline: false,
      isTextRead: true),
  // ChatModel(
  //     'Alexa Evans',
  //     'Someone sent a photo.',
  //     'assets/images/profile4.jpg',
  //     '16:01',
  //     isOnline: true,
  //     isTextRead: true),
  // ChatModel(
  //     'Tracey Foster',
  //     'Perfect, looking forw...eeing you',
  //     'assets/images/profile3.png',
  //     '14:03',
  //     isOnline: false,
  //     isTextRead: true),
  // ChatModel(
  //     'Isabella Owens',
  //     'Great session',
  //     'assets/images/profile2.jpg',
  //     '13:15',
  //     isOnline: true,
  //     isTextRead: true),
  // ChatModel(
  //     'Rachel Turner',
  //     'I hope so',
  //     'assets/images/profile1.jpg',
  //     '12:07',
  //     isOnline: true,
  //     isTextRead: false),
  // ChatModel(
  //     'Gloria Gibson',
  //     'Greating dear',
  //     'assets/images/profile.jpg',
  //     '11:32',
  //     isOnline: true,
  //     isTextRead: false
  // ),
];
