import 'package:flutter/material.dart';
import 'package:forca_so/utils/string.dart';
import './create_i_m_view_model.dart';
import 'widget_i_m_line.dart';

class CreateIMView extends CreateIMViewModel{
  _body(){
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            LOGO,
            width: 110,
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Doc Number",
                            style: TextStyle(
                                fontFamily: "Title",
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width:
                                MediaQuery.of(context).size.width / 2 - 70,
                                child: Text(
                                  'Select Doc number',
                                  style: TextStyle(
                                    fontFamily: "Title",
                                    fontSize: 14.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.expand_more),
                                  onPressed: () {}),
                            ],
                          ),
                          Container(
                            height: 1.0,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Movement Date",
                            style: TextStyle(
                                fontFamily: "Title",
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width:
                                MediaQuery.of(context).size.width / 2 - 70,
                                child: Text(
                                  'Select Movement Date',
                                  style: TextStyle(
                                    fontFamily: "Title",
                                    fontSize: 14.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.expand_more),
                                  onPressed: () {}),
                            ],
                          ),
                          Container(
                            height: 1.0,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Text("Inventory Move Line",
            style: TextStyle(
                fontFamily: "Title",
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
          imLine.isEmpty ?
          Container(
              height: 130.0,
              child: Center(
                child: Text(
                  "Inventory Move Line is empty\nPress + to add Inventory Move Line",
                  style: TextStyle(fontFamily: "Title"),
                  textAlign: TextAlign.center,
                ),
              ))
              : Expanded(
            child: ListView.builder(itemCount: imLine.length,
                itemBuilder: (context, index) =>
            WidgetIMLine.lineItem(context, imLine[index],(detailLine){
              WidgetIMLine.detailLine(context, detailLine);
            },(editLine){
              WidgetIMLine.editLine(context, (editLine){
                Navigator.pop(context);
              });
            },(deleteLine){
              setState(() {
                imLine.remove(deleteLine);
              });
            })),
          )
        ],
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Create Inventory Move",
        style: TextStyle(
          fontFamily: "Title",
          fontWeight: FontWeight.bold
        ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text(
                "Save",
            style: TextStyle(fontFamily: "Title",color: Colors.white)),
          )
        ],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            WidgetIMLine.addLine(context, (line) {
              setState(() {
                Navigator.pop(context);
                imLine.add(line);
              });
            });
          },
          tooltip: "Add IM Line",
          child: Icon(Icons.add),
        ),
      body: _body(),
    );
  }

}