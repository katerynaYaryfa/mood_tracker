import 'package:flutter/material.dart';

class AddNewNoteScreen extends StatelessWidget {
  const AddNewNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FAFB),
      appBar: AppBar(
        title: const Text(
          'Monday, July 11',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(
          0xFFF6FAFB,
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: 110,
                width: 328,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFE),
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF738C93).withOpacity(0.03),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'How was your day?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/rabbitIcon.png'),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Image(
                            image: AssetImage('images/rabbitIcon.png'),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Image(
                            image: AssetImage('images/rabbitIcon.png'),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Image(
                            image: AssetImage('images/rabbitIcon.png'),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Image(
                            image: AssetImage('images/rabbitIcon.png'),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Image(
                            image: AssetImage('images/rabbitIcon.png'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.all(16),
                height: 110,
                width: 328,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFE),
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF738C93).withOpacity(0.03),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Day in one sentence',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your thoughts',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10.0,
                            ),
                          ),
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
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
