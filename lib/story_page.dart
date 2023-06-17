import 'package:destiny/story_brain.dart';
import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  //  This is to enable access TO THE CLASS.
  StoryBrain storyBrain = StoryBrain();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: [
            //TODO: Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
            Expanded(
              flex: 12,
              child: Text(
                storyBrain.getStory(),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //Choice 1 made by user.
                //TODO: Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                // storyBrain.nextStory(1);
                setState(() {
                  storyBrain.nextStory(1);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                // 'Choice 1',
                storyBrain.getChoice1(),
              ),
            ),
            const Spacer(),
            Visibility(
              visible: storyBrain.buttonShouldBeVisible(),
              child: ElevatedButton(
                onPressed: () {
                  //TODO: Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                  // storyBrain.nextStory(2);
                  setState(() {
                    storyBrain.nextStory(2);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  // 'Choice 2',
                  storyBrain.getChoice2(),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
