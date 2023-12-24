import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx_example/constants/app_colors.dart';
import 'package:mobx_example/constants/assets.dart';
import 'package:mobx_example/core/models/screen_args.dart';

class GetTicketScreen extends StatefulWidget {
  const GetTicketScreen({super.key});

  @override
  State<GetTicketScreen> createState() => _GetTicketScreenState();
}

class _GetTicketScreenState extends State<GetTicketScreen> {
  // variables: -------------------------------------------------------------
  ScreenArguments<int>? args;
  int? movieId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    args = ModalRoute.of(context)!.settings.arguments as ScreenArguments<int>?;
    movieId = args?.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SeatSelectionScreen(),
    );
  }
}

class SeatModel {
  final int row;
  final int number;
  bool isBooked;

  SeatModel({required this.row, required this.number, this.isBooked = false});
}

class SeatSelectionScreen extends StatefulWidget {
  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  // Define your seat layout here
  final List<List<int>> seatLayout = [
    [2, 14, 2],
    [4, 14, 4],
    [4, 14, 4],
    [5, 14, 5],
    [5, 14, 5],
    [5, 14, 5],
    [5, 14, 5],
    [5, 14, 5],
    [5, 14, 5],
    [5, 14, 5],
  ];

  List<List<SeatModel>> seats = [];

  @override
  void initState() {
    super.initState();
    generateSeats();
  }

  void generateSeats() {
    for (int i = 0; i < seatLayout.length; i++) {
      List<SeatModel> rowSeats = [];
      for (int j = 1; j <= seatLayout[i][1]; j++) {
        rowSeats.add(SeatModel(row: i + 1, number: j));
      }
      seats.add(rowSeats);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 22,
          ),
          SvgPicture.asset(
            Assets.screen,
          ),
          const Text('Screen'),
          const SizedBox(
            height: 12,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: seats.length,
            itemBuilder: (context, rowIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add left pedestrian path
                  buildPedestrianPath(),
                  // Build seats
                  ...seats[rowIndex].map((seat) => buildSeat(seat)),
                  // Add right pedestrian path
                  buildPedestrianPath(),
                ],
              );
            },
          ),
          const SizedBox(
            height: 52,
          ),
          Text('UI inprogress.....')
        ],
      ),
    );
  }

  Widget buildPedestrianPath() {
    return const SizedBox(
        width: 16.0); // Adjust the width of the pedestrian path
  }

  Widget buildSeat(SeatModel seat) {
    return InkWell(
      onTap: () {
        // Handle seat booking logic here
        setState(() {
          seat.isBooked = !seat.isBooked;
        });
      },
      child: SvgPicture.asset(
        Assets.seat,
        height: 22,
        color: seat.isBooked ? Colors.deepPurple : AppColors.blue,
      ),
    );
  }
}
