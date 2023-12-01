import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/core/config/styles/dimens.dart';
import 'package:trips/features/trips/presentaion/bloc/trip_bloc.dart';
import 'package:trips/features/trips/presentaion/bloc/trip_event.dart';
import 'package:trips/features/trips/presentaion/bloc/trip_state.dart';
import 'package:trips/features/trips/presentaion/widgets/trip_search_form.dart';

class TripsSearchPage extends StatefulWidget {
  const TripsSearchPage({super.key});

  @override
  State<TripsSearchPage> createState() => _TripsSearchPageState();
}

class _TripsSearchPageState extends State<TripsSearchPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  TextEditingController departureCtrl = TextEditingController();
  TextEditingController destinationCtrl = TextEditingController();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    departureCtrl.dispose();
    destinationCtrl.dispose();
    super.dispose();
  }

  List<bool> selectedTypes = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TripsBloc, TripState>(
        builder: (contex, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: TripSearchForm(
                  tabController: tabController,
                  departureCtrl: departureCtrl,
                  destinationCtrl: destinationCtrl,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.midMargin),
                  child: SizedBox(
                    height: 44,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<TripsBloc>(context, listen: false).add(
                          SearchTripsEvent(
                            departure: departureCtrl.text,
                            destination: destinationCtrl.text,
                            date: '2023-11-30',
                          ),
                        );
                      },
                      child: state is LoadingTripState
                          ? const CircularProgressIndicator.adaptive()
                          : const Text('Search'),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
