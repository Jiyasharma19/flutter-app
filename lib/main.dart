import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Time',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 194, 44, 71)),
        useMaterial3: true,
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 147, 57, 220),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Quiz Time"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 22,
            ),
            Text(
              "Operating System Quiz",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              child: Text("Enter"),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 149, 70),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 61, 114),
        title: const Text("Home Page"),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 102, 173, 193),
        child: const Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: Color.fromARGB(255, 222, 200, 71),
            ),
            ListTile(
              title: Text('Home', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: Text('Profile', style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              title: Text('Settings', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Click To start Quiz",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QUIZ()),
                );
              },
              child: Text("START QUIZ"),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("HOME"),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;
  final int answer;

  Question({
    required this.question,
    required this.options,
    required this.answer,
  });
}

class QUIZ extends StatefulWidget {
  const QUIZ({Key? key}) : super(key: key);

  @override
  State<QUIZ> createState() => _QUIZState();
}

class _QUIZState extends State<QUIZ> {
  final List<Question> questions = [
    Question(
     question: 'What does CPU stand for?',
      options: ['Central Processing Unit', 'Computer Personal Unit', 'Central Processor Unit', 'Central Peripheral Unit'],
      answer: 0,
    ),
    Question(
      question: 'Which operating system is developed by Microsoft?',
      options: ['Linux', 'Windows', 'iOS', 'Android'],
      answer: 1,
    ),
    Question(
      question: 'What is the main function of the kernel in an operating system?',
      options: ['Manage hardware resources', 'Run applications', 'Control user access', 'Handle network communication'],
      answer: 0,
    ),
    Question(
      question: 'What is the purpose of virtual memory?',
      options: ['Increase RAM size', 'Store temporary files', 'Run virtual machines', 'Enhance graphics performance'],
      answer: 0,
    ),
    Question(
      question: 'Which file system is used in Windows operating systems?',
      options: ['EXT4', 'FAT32', 'NTFS', 'HFS+'],
      answer: 2,
    ),
    Question(
      question: 'What is a process in an operating system?',
      options: ['A program in execution', 'A file on the hard disk', 'A system utility', 'A hardware component'],
      answer: 0,
    ),
    Question(
      question: 'Which scheduling algorithm is used in most operating systems?',
      options: ['First Come First Serve', 'Shortest Job Next', 'Round Robin', 'Priority Scheduling'],
      answer: 2,
    ),
    Question(
      question: 'What is the purpose of an operating system?',
      options: ['Manage hardware resources', 'Run applications', 'Provide a user interface', 'All of the above'],
      answer: 3,
    ),
    Question(
      question: 'Which command is used to list files in a directory in Unix-based systems?',
      options: ['ls', 'dir', 'list', 'show'],
      answer: 0,
    ),
    Question(
      question: 'What is a shell in the context of operating systems?',
      options: ['A part of the kernel', 'A user interface', 'A hardware component', 'A file system'],
      answer: 1,
        ),
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;

  void _checkAnswer(int optionIndex) {
    if (_currentQuestionIndex < questions.length) {
      if (optionIndex == questions[_currentQuestionIndex].answer) {
        // Correct answer
        _score++;
      } else {
        // Wrong answer
      }
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
      if (_currentQuestionIndex >= questions.length) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Quiz Completed!'),
              Text('Your score: $_score/${questions.length}'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentQuestionIndex = 0;
                    _score = 0;
                  });
                },
                child: Text('Restart Quiz'),
              ),
              SizedBox(
              height: 25,
            ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Quit"),
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[300],
          title: Text('Quiz Time'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Question ${_currentQuestionIndex + 1}/${questions.length}',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              Text(questions[_currentQuestionIndex].question),
              SizedBox(height: 20.0),
              for (int i = 0;
                  i < questions[_currentQuestionIndex].options.length;
                  i++)
                ElevatedButton(
                  onPressed: () => _checkAnswer(i),
                  child: Text(questions[_currentQuestionIndex].options[i]),
                ),
            ],
          ),
        ),
      );
    }
    
  }
}
