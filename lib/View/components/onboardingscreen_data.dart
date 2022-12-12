// ignore_for_file: non_constant_identifier_names

class OnBoarding {
  final String title;
  final String image;
  final String Description;

  OnBoarding( {
   required this.Description,
    required this.title,
    required this.image,
  });
}

List<OnBoarding> onboarding_data = [
    OnBoarding(
    title: 'Blood Pressure\nTools',
    image: 'assets/images/BPT.jpg',
    Description: "Tools that help you track exact results\nof your blood pressure"
  ),
  OnBoarding(
    title: 'Graph & Health\nReport',
    image: 'assets/images/GHR.jpg',
    Description: "Keep tracking your blood pressure's\nin graph form"
  ),
    OnBoarding(
    title: 'Blood Pressure\nInformation',
    image: 'assets/images/BPI.jpg',
    Description: "Keep tracking your blood pressure's\ninformation"
  ),
];

