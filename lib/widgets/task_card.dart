import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 175,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 206, 242, 254)),
      child: Stack(
        children: [
          const Positioned(
              top: 20,
              left: 20,
              child: Text("Finance App Landing Page",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromARGB(255, 27, 28, 30)))),
          Positioned(
            left: 20,
            top: 90,
            width: double.maxFinite,
            child: Row(
              children: [
                Text(
                  "Priority : ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 27, 28, 30),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red),
                  child: const Text(
                    "High",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 120,
            width: double.maxFinite,
            child: Row(
              children: [
                Text(
                  "Due date : ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 27, 28, 30),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  "Jan 30",
                  style: TextStyle(
                      color: Color.fromARGB(255, 27, 28, 30),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          // Positioned(
          //     bottom: 20,
          //     left: 20,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(
          //           // height: 30,
          //           // width: 50,
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 10, vertical: 2),
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               color: Colors.red),
          //           child: const Text(
          //             "High",
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //         SizedBox(
          //           width: 170,
          //         ),
          //         const Text(
          //           "Due Date : Jan 30",
          //           style: TextStyle(
          //             color: Colors.black87,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         )
          //       ],
          //     )),
          Positioned(
              top: 10,
              right: 5,
              child: IconButton(
                icon: Icon(Icons.more_vert,
                    color: Color.fromARGB(255, 27, 28, 30)),
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}
