import 'package:flutter/material.dart';

void main() => runApp(TopicListScreen());


class TopicListScreen extends StatefulWidget {
  @override
  _TopicListScreenState createState() => _TopicListScreenState();
}

class _TopicListScreenState extends State<TopicListScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primaryColor: Colors.lightBlue,
        hintColor: Colors.white,
        appBarTheme: AppBarTheme(
        color: Colors.lightBlue,
    ),
    ),
     home: Scaffold(
      appBar: AppBar(
        title: Text('Topic List'),
      ),
      body: ListView(
        children: [
          TopicItem(
            title: 'Topic 1',
            onGatherKnowledge: () {
              // Navigate to the Gather Knowledge screen for Topic 1
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GatherKnowledgeScreen(topic: 'Topic 1'),
                ),
              );
            },
            onTestKnowledge: () {
              // Navigate to the Test Knowledge screen for Topic 1
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TestKnowledgeScreen(topic: 'Topic 1'),
                ),
              );
            },
            onViewArticles: () {
              // Navigate to the Articles screen for Topic 1
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticlesScreen(topic: 'Topic 1'),
                ),
              );
            },
            onViewVideos: () {
              // Navigate to the Videos screen for Topic 1
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideosScreen(topic: 'Topic 1'),
                ),
              );
            },
          ),
          // Add more topics as needed
        ],
      ),
    ),
    );
  }
}

class TopicItem extends StatelessWidget {
  final String title;
  final VoidCallback onGatherKnowledge;
  final VoidCallback onTestKnowledge;
  final VoidCallback onViewArticles;
  final VoidCallback onViewVideos;

  TopicItem({
    required this.title,
    required this.onGatherKnowledge,
    required this.onTestKnowledge,
    required this.onViewArticles,
    required this.onViewVideos,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        // Display a dialog with options to gather knowledge, test knowledge, view articles, or view videos.
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Select an option for $title'),
              actions: <Widget>[
                TextButton(
                  child: Text('Gather Knowledge'),
                  onPressed: onGatherKnowledge,
                ),
                TextButton(
                  child: Text('Test Knowledge'),
                  onPressed: onTestKnowledge,
                ),
                TextButton(
                  child: Text('View Articles'),
                  onPressed: onViewArticles,
                ),
                TextButton(
                  child: Text('View Videos'),
                  onPressed: onViewVideos,
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class GatherKnowledgeScreen extends StatelessWidget {
  final String topic;

  GatherKnowledgeScreen({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gather Knowledge - $topic'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Gather Knowledge screen for $topic!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Test Knowledge screen for the selected topic
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestKnowledgeScreen(topic: topic),
                  ),
                );
              },
              child: Text('Test Knowledge'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Articles screen for the selected topic
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticlesScreen(topic: topic),
                  ),
                );
              },
              child: Text('View Articles'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Videos screen for the selected topic
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideosScreen(topic: topic),
                  ),
                );
              },
              child: Text('View Videos'),
            ),
          ],
        ),
      ),
    );
  }
}

class TestKnowledgeScreen extends StatelessWidget {
  final String topic;

  TestKnowledgeScreen({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Knowledge - $topic'),
      ),
      body: Center(
        child: Text(
          'This is the Test Knowledge screen for $topic.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class ArticlesScreen extends StatelessWidget {
  final String topic;

  ArticlesScreen({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles - $topic'),
      ),
      body: Center(
        child: Text(
          'List of articles for $topic will be displayed here.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class VideosScreen extends StatelessWidget {
  final String topic;

  VideosScreen({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos - $topic'),
      ),
      body: Center(
        child: Text(
          'List of videos for $topic will be displayed here.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
