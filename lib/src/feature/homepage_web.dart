import 'package:flutter/material.dart';
import 'package:exam_app/src/api/api_services.dart';
import 'package:exam_app/src/feature/details/details_page.dart';
import 'package:exam_app/src/feature/widgets/custom_button.dart';
import 'package:exam_app/src/feature/widgets/custom_person_tile.dart';
import 'package:exam_app/src/model/person.dart';
import 'package:exam_app/utils/extension.dart';

class HomepageWeb extends StatefulWidget {
  const HomepageWeb({super.key});

  @override
  State<HomepageWeb> createState() => _HomepageWebState();
}

class _HomepageWebState extends State<HomepageWeb> {
  List<Person>? persons;
  int pages = 10;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

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

  void getNextPage() {
    setState(() {
      isLoaded = false;
    });
    getPerson(pages).then(
      (value) => setState(() {
        persons = persons!.sublist(persons!.length - 10);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PERSON'),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                isLoaded = false;
              });
              pages = 10;
              getPerson(pages);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.refresh,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (pages != 10)
                  CustomButton(
                    onPressed: () {
                      if (pages != 10) {
                        pages -= 10;
                        getNextPage();
                      }
                    },
                    title: 'Previous',
                  ),
                CustomButton(
                  onPressed: () {
                    if (pages != 40) {
                      pages += 10;
                      getNextPage();
                    } else {
                      context.showSnackBar(
                          content:
                              const Center(child: Text('Unable to Load More')));
                    }
                  },
                  title: 'Next',
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
