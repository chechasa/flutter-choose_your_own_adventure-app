import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: screen(),
    );
  }
}

class screen extends StatefulWidget {
  @override
  State<screen> createState() => _screenState();
}

var storyBrain = StoryBrain();

class _screenState extends State<screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.cover),
          ),
          constraints: BoxConstraints.expand(),
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          child: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 12,
                    child: Center(
                      child: Text(
                        storyBrain.getStory(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            storyBrain.nextStory(1);
                          });
                        },
                        child: Text(
                          storyBrain.getChoiceOne(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    flex: 2,
                    child: Visibility(
                      visible: storyBrain.buttonShouldBeVisible(),
                      child: Container(
                        color: Colors.blue,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              storyBrain.nextStory(2);
                            });
                          },
                          child: Text(
                            storyBrain.getChoiceTwo(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
