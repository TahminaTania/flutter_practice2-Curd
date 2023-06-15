import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_p2/dashboard/screen/singledata_screen.dart';
import 'package:flutter_p2/features/showdata/cubit/fetchdata_cubit.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<FetchdataCubit>();
      cubit.fetchdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        child: BlocBuilder<FetchdataCubit, FetchdataState>(
          builder: (context, state) {
            if (state is FetchdataInitial) {
              return Container(
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    SizedBox(
                      child: CircularProgressIndicator(),
                    ),
                    SizedBox(
                      child: Text(state.toString()),
                    )
                  ],
                ),
              );
            } else if (state is dataLoadedState) {
              final datas = state.dataCollections;
              return ListView.builder(
                  itemCount: datas.length,
                  itemBuilder: (context, index) {
                    final data = datas[index];
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SingledataScreen(data: data)));
                        },
                        tileColor: Colors.grey,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data.title),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                    onPressed: () {}, child: Icon(Icons.edit)),
                                SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Icon(Icons.delete))
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (state is dataErrorState) {
              return Text(state.error);
            }
            return Text(state.toString());
          },
        ),
      )),
    );
  }
}
