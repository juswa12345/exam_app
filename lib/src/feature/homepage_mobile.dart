import 'package:flutter/material.dart';
import 'package:exam_app/src/api/api_services.dart';
import 'package:exam_app/src/feature/details/details_page.dart';
import 'package:exam_app/src/feature/widgets/custom_person_tile.dart';
import 'package:exam_app/src/model/person.dart';
import 'package:exam_app/utils/extension.dart';

class HomepageMobile extends StatefulWidget {
  const HomepageMobile({super.key});

  @override
  State<HomepageMobile> createState() => _HomepageMobileState();
}

class _HomepageMobileState extends State<HomepageMobile> {
  final scrollCrontroller = ScrollController();

  int pages = 10;

  List<Person>? persons;

  bool isLoaded = false;

  bool newItemsLoaded = true;

  @override
  void initState() {
    super.initState();
    scrollCrontroller.addListener(_scrollListener);
    getPerson(pages);
  }

  Future<void> getPerson(int pages) async {
    persons = await ApiServices().getPerson(pages);

    if (persons != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('PERSON')),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          pages = 10;
          return getPerson(pages);
        },
        child: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollCrontroller,
                  itemCount: persons?.length,
                  itemBuilder: (context, index) => CustomPersonTile(
                    person: persons![index],
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsPage(person: persons![index]))),
                  ),
                ),
              ),
              if (!newItemsLoaded)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _scrollListener() async {
    if (scrollCrontroller.position.pixels ==
        scrollCrontroller.position.maxScrollExtent) {
      if (pages != 40) {
        pages += 10;
        setState(() {
          newItemsLoaded = false;
        });
        await getPerson(pages)
            .then((value) => setState(() => newItemsLoaded = true));
      } else {
        context.showSnackBar(
            content: const Center(child: Text('No More Data to Fetch')));
      }
    }
  }
}
