import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';
import '../widgets/day_selector.dart';
import '../widgets/event_card.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Welcome back,\nMark.',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          width: 38,
                          height: 38,
                          margin: const EdgeInsets.only(top: 12),
                          child: Image.asset('assets/images/avatar.png'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 9),
                    const CustomSearchBar(),
                    const SizedBox(height: 26),
                    const DaySelector(),
                    const SizedBox(height: 26),
                    const Text(
                      'Upcoming events',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/battery.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 26),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Deadlines',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const EventCard(
                      icon: 'assets/images/deadline1.png',
                      title: 'GDG Orientation',
                      date: '30 April, 2025',
                    ),
                    const SizedBox(height: 10),
                    const EventCard(
                      icon: 'assets/images/deadline2.png',
                      title: 'Group Discussion',
                      date: 'Today at 17:00',
                    ),
                    const SizedBox(height: 26),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
