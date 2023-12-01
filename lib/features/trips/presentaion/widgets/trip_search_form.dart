import 'package:flutter/material.dart';
import 'package:trips/core/config/styles/dimens.dart';

class TripSearchForm extends StatelessWidget {
  final TabController tabController;
  final TextEditingController departureCtrl;
  final TextEditingController destinationCtrl;
  const TripSearchForm({
    super.key,
    required this.tabController,
    required this.departureCtrl,
    required this.destinationCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Dimens.midMargin),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Poisk poyezdok',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.sort,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Dimens.midMargin,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              color: const Color.fromARGB(255, 241, 240, 240),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                controller: tabController,
                indicator: const BoxDecoration(
                  color: Colors.green,
                ),
                labelColor: Colors.white,
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(
                    text: 'Passazhir',
                  ),
                  Tab(
                    text: 'Woditel',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.midMargin),
            child: Row(
              children: [
                // const Column(
                //   children: [],
                // ),
                Expanded(
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: departureCtrl,
                        ),
                        const SizedBox(height: Dimens.midMargin),
                        TextFormField(
                          controller: destinationCtrl,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // SizedBox(
          //   width: double.infinity,
          //   child: ToggleButtons(
          //     borderRadius: BorderRadius.circular(30),

          //     fillColor: Colors.green,
          //     isSelected: selectedTypes,
          //     onPressed: (int val) {
          //       setState(() {
          //         for (int i = 0; i < selectedTypes.length; i++) {
          //           selectedTypes[i] = false;
          //         }
          //         selectedTypes[val] = true;
          //       });
          //     },
          //     selectedColor: Colors.white,
          //     children: const [
          //       Padding(
          //         padding: EdgeInsets.all(Dimens.smallMargin),
          //         child: Text('Passazhir'),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.all(Dimens.smallMargin),
          //         child: Text('Woditel'),
          //       ),
          //     ],
          //   ),
          // ),
          // Row(
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {},
          //       child: Text('data'),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
