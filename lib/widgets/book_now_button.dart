import 'package:flutter/material.dart';

class BookNowButton extends StatelessWidget {
  const BookNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      
          Center(
            child: FractionallySizedBox(
              
              widthFactor: .94,
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFf5669FF),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Container(),
                  const Text("BOOK NOW",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      )),
                  const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 30,
                        color: Colors.white
                    // color:Color(0xFF3D55F0),
                    ,
                  ),
                ]),
              
                ),
            
                  
                ),
          );
  }
}
