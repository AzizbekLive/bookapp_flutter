import 'package:bookapp_flutter/ui/pages/dashboard/dashboard_page.dart';import 'package:bookapp_flutter/ui/pages/library/library_page.dart';import 'package:bookapp_flutter/ui/pages/profile/profile_page.dart';import 'package:bookapp_flutter/ui/pages/search/search_page.dart';import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:google_fonts/google_fonts.dart';import '../playing/playing_page.dart';import 'bloc/home_bloc.dart';class HomePage extends StatefulWidget {  const HomePage({super.key});  @override  State<HomePage> createState() => _HomePageState();}class _HomePageState extends State<HomePage> {  int currentTab = 0;  final PageStorageBucket bucket = PageStorageBucket();  Widget currentScreen = const DashboardPage();  final List<Widget> screens = [    const DashboardPage(),    const SearchPage(),    const LibraryPage(),    const ProfilePage()  ];  @override  Widget build(BuildContext context) {    return BlocProvider(      create: (context) => HomeBloc(),      child: BlocConsumer<HomeBloc, HomeState>(        listener: (context, state) {          if (state is BookToPlayState) {            Navigator.push(              context,              PageRouteBuilder(                pageBuilder: (context, animation, secondaryAnimation) =>                    PlayingPage(state.id.toString()),                transitionsBuilder:                    (context, animation, secondaryAnimation, child) {                  const begin = Offset(1.0, 0.0);                  const end = Offset.zero;                  const curve = Curves.ease;                  var tween = Tween(begin: begin, end: end)                      .chain(CurveTween(curve: curve));                  var offsetAnimation = animation.drive(tween);                  return SlideTransition(                    position: offsetAnimation,                    child: child,                  );                },              ),            );          }        },        builder: (context, state) {          return Scaffold(            body: PageStorage(bucket: bucket, child: currentScreen),            floatingActionButton: Container(              height: 56,              width: 56,              decoration: BoxDecoration(                shape: BoxShape.circle,                color: Colors.white,                boxShadow: [                  BoxShadow(                    color: Colors.black.withOpacity(0.1),                    spreadRadius: 1,                    blurRadius: 1,                    offset: const Offset(0, 1),                  ),                ],              ),              child: Padding(                padding: const EdgeInsets.all(5.0),                child: InkWell(                    onTap: () {                      context.read<HomeBloc>().add(BookToPlayEvent());                    },                    child: Container(                      decoration: const BoxDecoration(                          shape: BoxShape.circle, color: Color(0xFFF26B6C)),                      child: const Icon(                        Icons.play_arrow_rounded,                        size: 30,                        color: Colors.white,                      ),                    )),              ),            ),            floatingActionButtonLocation:                FloatingActionButtonLocation.centerDocked,            bottomNavigationBar: BottomAppBar(              color: const Color(0xFFFFFFFF),              shape: const CircularNotchedRectangle(),              notchMargin: 10,              child: Container(                height: 60,                decoration: const BoxDecoration(                    borderRadius: BorderRadius.only(                        topLeft: Radius.circular(100),                        topRight: Radius.circular(100))),                child: Row(                  mainAxisAlignment: MainAxisAlignment.spaceBetween,                  children: [                    Row(                      crossAxisAlignment: CrossAxisAlignment.start,                      children: [                        MaterialButton(                          splashColor: Colors.transparent,                          highlightColor: Colors.transparent,                          minWidth: 40,                          onPressed: () {                            setState(() {                              currentScreen = screens[0];                              currentTab = 0;                            });                          },                          child: Column(                            mainAxisAlignment: MainAxisAlignment.center,                            children: [                              Image.asset("assets/icons/ic_home.png",                                  color: currentTab == 0                                      ? const Color(0xFFF26B6C)                                      : const Color(0xFF7D7D7D)),                              const SizedBox(height: 7),                              Text(                                'Home',                                textAlign: TextAlign.center,                                style: GoogleFonts.ubuntu(                                  color: currentTab == 0                                      ? const Color(0xFFF26B6C)                                      : const Color(0xFF7D7D7D),                                  fontSize: 11,                                  fontWeight: FontWeight.w500,                                  height: 0,                                ),                              )                            ],                          ),                        ),                        MaterialButton(                          splashColor: Colors.transparent,                          highlightColor: Colors.transparent,                          minWidth: 40,                          onPressed: () {                            setState(() {                              currentScreen = screens[1];                              currentTab = 1;                            });                          },                          child: Column(                            mainAxisAlignment: MainAxisAlignment.center,                            children: [                              Image.asset("assets/icons/ic_search.png",                                  color: currentTab == 1                                      ? const Color(0xFFF26B6C)                                      : const Color(0xFF7D7D7D)),                              const SizedBox(height: 7),                              Text(                                'Search',                                textAlign: TextAlign.center,                                style: GoogleFonts.ubuntu(                                  color: currentTab == 1                                      ? const Color(0xFFF26B6C)                                      : const Color(0xFF7D7D7D),                                  fontSize: 11,                                  fontWeight: FontWeight.w500,                                  height: 0,                                ),                              )                            ],                          ),                        ),                      ],                    ),                    Row(                      crossAxisAlignment: CrossAxisAlignment.start,                      children: [                        MaterialButton(                          splashColor: Colors.transparent,                          highlightColor: Colors.transparent,                          minWidth: 40,                          onPressed: () {                            setState(() {                              currentScreen = screens[2];                              currentTab = 2;                            });                          },                          child: Column(                            mainAxisAlignment: MainAxisAlignment.center,                            children: [                              Image.asset("assets/icons/ic_book.png",                                  color: currentTab == 2                                      ? const Color(0xFFF26B6C)                                      : const Color(0xFF7D7D7D)),                              const SizedBox(height: 7),                              Text(                                'Library',                                textAlign: TextAlign.center,                                style: GoogleFonts.ubuntu(                                  color: currentTab == 2                                      ? const Color(0xFFF26B6C)                                      : const Color(0xFF7D7D7D),                                  fontSize: 11,                                  fontWeight: FontWeight.w500,                                  height: 0,                                ),                              )                            ],                          ),                        ),                        MaterialButton(                          splashColor: Colors.transparent,                          highlightColor: Colors.transparent,                          minWidth: 40,                          onPressed: () {                            setState(() {                              currentScreen = screens[3];                              currentTab = 3;                            });                          },                          child: Column(                            mainAxisAlignment: MainAxisAlignment.center,                            children: [                              Image.asset("assets/icons/ic_user.png",                                  color: currentTab == 3                                      ? const Color(0xFFF26B6C)                                      : const Color(0xFF7D7D7D)),                              const SizedBox(height: 7),                              Text(                                'Profile',                                textAlign: TextAlign.center,                                style: GoogleFonts.ubuntu(                                  color: currentTab == 3                                      ? const Color(0xFFF26B6C)                                      : const Color(0xFF7D7D7D),                                  fontSize: 11,                                  fontWeight: FontWeight.w500,                                  height: 0,                                ),                              )                            ],                          ),                        ),                      ],                    ),                  ],                ),              ),            ),          );        },      ),    );  }}