import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/features/trips/bloc/trip_bloc.dart';
import 'package:trips/features/trips/bloc/trip_state.dart';
import 'package:trips/features/trips/view/widgets/trip_search_form.dart';
import 'package:trips/features/trips/view/widgets/trip_widget.dart';
import 'package:trips/injection_container.dart';

class TripsSearchPage extends StatefulWidget {
  const TripsSearchPage({super.key});

  @override
  State<TripsSearchPage> createState() => _TripsSearchPageState();
}

class _TripsSearchPageState extends State<TripsSearchPage> {
  TripsBloc tripsBloc = locator.get<TripsBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TripsBloc, TripState>(
        bloc: tripsBloc,
        builder: (contex, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: TripSearchForm(
                  tripsBloc: tripsBloc,
                  tripState: state,
                ),
              ),
              if (state is ErrorTripState)
                SliverToBoxAdapter(
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: Text(
                      state.error?.message ?? '',
                      style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                )
              else if (state is EmptyTripState)
                SliverToBoxAdapter(
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: Text(
                      state.text,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                )
              else if (state is InitialTripState)
                SliverList.builder(
                  itemCount: state.trips.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TripWidget(trip: state.trips[index]);
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
