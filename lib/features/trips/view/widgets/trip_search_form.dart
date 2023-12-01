import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trips/common/widgets/k_textfield.dart';
import 'package:trips/config/styles/dimens.dart';
import 'package:trips/config/styles/text_styles.dart';
import 'package:trips/config/theme/app_colors.dart';
import 'package:trips/features/trips/bloc/trip_bloc.dart';
import 'package:trips/features/trips/bloc/trip_event.dart';
import 'package:trips/features/trips/bloc/trip_state.dart';

class TripSearchForm extends StatefulWidget {
  final TripsBloc tripsBloc;
  final TripState tripState;
  const TripSearchForm({
    super.key,
    required this.tripsBloc,
    required this.tripState,
  });

  @override
  State<TripSearchForm> createState() => _TripSearchFormState();
}

class _TripSearchFormState extends State<TripSearchForm>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  TextEditingController departureCtrl = TextEditingController();
  TextEditingController destinationCtrl = TextEditingController();
  String? pickedDate;
  String? dateErrorText;

  var formKey = GlobalKey<FormState>();

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

  pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      pickedDate = DateFormat('yyyy-MM-dd').format(date);
      dateErrorText = null;
    }
    setState(() {});
  }

  bool validate() {
    bool res = formKey.currentState?.validate() ?? false;
    if (pickedDate == null) {
      res = false;
      setState(() {
        dateErrorText = 'Необходимо выбрать дату';
      });
    }

    return res;
  }

  searchTrips() {
    if (validate()) {
      widget.tripsBloc.add(
        SearchTripsEvent(
          departure: departureCtrl.text,
          destination: destinationCtrl.text,
          date: pickedDate!,
          // departure: 'Казань',
          // destination: 'Уфа',
          // date: '2023-12-01',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(Dimens.midMargin),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Поиск поездок',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Material(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.sort,
                      ),
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
                      color: AppColors.primaryGreen,
                    ),
                    labelColor: colorScheme.surface,
                    unselectedLabelColor: colorScheme.onSurface,
                    dividerColor: Colors.transparent,
                    tabs: const [
                      Tab(
                        text: 'Пассажир',
                      ),
                      Tab(
                        text: 'Водитель',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimens.midMargin),
                child: SizedBox(
                  height: 180,
                  child: Row(
                    children: [
                      const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 14.0),
                            child: Icon(
                              Icons.adjust,
                              color: AppColors.primaryGreen,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: Dimens.xsmallMargin,
                            ),
                            child: DottedLine(
                              direction: Axis.vertical,
                              lineLength: 40,
                              dashColor: AppColors.primaryGreen,
                            ),
                          ),
                          Icon(
                            Icons.location_on_rounded,
                            color: AppColors.primaryGreen,
                            size: 30,
                          ),
                        ],
                      ),
                      const SizedBox(width: Dimens.midMargin),
                      Expanded(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              KTextField(
                                controller: departureCtrl,
                                hintText: 'Откуда',
                                suffixIcon: const Icon(
                                  Icons.gps_fixed,
                                  color: AppColors.primaryGreen,
                                ),
                              ),
                              const SizedBox(height: Dimens.midMargin),
                              KTextField(
                                controller: destinationCtrl,
                                hintText: 'Куда',
                                suffixIcon: const Icon(
                                  Icons.gps_fixed,
                                  color: AppColors.primaryGreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimens.midMargin),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      pickedDate ?? 'Выберите дату',
                      style: TextStyles.title2.copyWith(
                        color: dateErrorText != null
                            ? Theme.of(context).colorScheme.error
                            : null,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: pickDate,
                    child: const Icon(
                      Icons.date_range,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.midMargin,
            vertical: Dimens.xlargeMargin,
          ),
          child: SizedBox(
            height: 56,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: searchTrips,
              child: widget.tripState is LoadingTripState
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.white,
                      ),
                    )
                  : const Text('Найти'),
            ),
          ),
        ),
      ],
    );
  }
}
