import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/screens/task_lists.dart';
import 'package:todo_app/screens/upcoming_screen.dart';
import 'package:todo_app/providers/providers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void changeCurrentIndex(WidgetRef ref, value) {
    ref.read(currentIndexProvider.notifier).state = value!;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final currentIndex = ref.watch(currentIndexProvider);
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            elevation: 2,
            shadowColor: Colors.black,
            title: const Text("My Tasks"),
            actions: [
              IconButton(
                  highlightColor: Colors.transparent,
                  onPressed: () {},
                  icon: const Icon(Icons.settings))
            ],
          ),
          body: PageView(
            onPageChanged: (value) {
              changeCurrentIndex(ref, value);
            },
            controller: pageController,
            children: const [TaskList(), UpcomingScreen()],
          ),
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(side: BorderSide.none),
            backgroundColor: const Color(0xffFFBF9B),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddTaskScreen()));
            },
            child: const Icon(
              Icons.add,
              size: 35,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: NavigationBar(
            selectedIndex: currentIndex,
            backgroundColor: Colors.black,
            indicatorColor: Colors.transparent,
            onDestinationSelected: (value) {
              changeCurrentIndex(ref, value);
              pageController.animateToPage(value,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            },
            destinations: [
              NavigationDestination(
                  icon: Icon(
                    Icons.home,
                    color: currentIndex == 0 ? Colors.amber : Colors.white,
                  ),
                  label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.calendar_month,
                      color: currentIndex == 1 ? Colors.amber : Colors.white),
                  label: "Upcoming")
            ],
          ),
        );
      },
    );
  }
}
