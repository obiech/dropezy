import 'package:cinephile/application/core/enums.dart';
import 'package:cinephile/application/trailer/trailer_cubit.dart';
import 'package:cinephile/presentation/cinephile/trailer/widgets/feed.dart';
import 'package:cinephile/presentation/core/widgets/error.dart';
import 'package:cinephile/presentation/core/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrailerScreen extends StatefulWidget {
  const TrailerScreen({Key? key}) : super(key: key);

  @override
  _TrailerScreenState createState() => _TrailerScreenState();
}

class _TrailerScreenState extends State<TrailerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<TrailerCubit, TrailerState>(
          builder: (context, state) {
            if (state.status == Status.error) {
              return ErrorBuilder(errMessage: state.error);
            } else if (state.status == Status.success) {
              return Feed(data: state.trailer);
            } else {
              return const Loader();
            }
          },
        ));
  }
}
