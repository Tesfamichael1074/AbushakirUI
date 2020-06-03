import 'package:abushakir/abushakir.dart';
import 'package:flutter/material.dart';
import '../src/model/dayModel.dart';

class AbushakirUiDialog extends StatefulWidget {
  @override
  _AbushakirUiDialogState createState() => _AbushakirUiDialogState();
}

class _AbushakirUiDialogState extends State<AbushakirUiDialog> {
   EtDatetime now = new EtDatetime.now();
      EtDatetime today = EtDatetime.now();
      int previoslySelected;
      int startDate;
      int selectedDate;

      List<String> months = ["መስከረም", "ጥቅምት", "ኅዳር", "ታኅሣሥ" , "ጥር", "የካቲት", "መጋቢት", "ሚያዝያ", "ግንቦት", "ሰኔ", "ሐምሌ", "ነሐሴ", "ጳጐሜን"];

    List<DayModel> rowDataData = [

      DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),
      DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),
      DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),
      DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),
      DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),DayModel(),

    ];

    void populateData(){
      startDate = now.weekday;
      // print("start date  " + startDate.toString());

      for (int i=startDate; i < rowDataData.length ; i++ ){
        if(i - startDate + 1 < 31){
           rowDataData[i].id = i - startDate + 1;
           rowDataData[i].today = false;
        }
       
        
        else{
          rowDataData[i].id = null;
        }
        
        // print(i.toString() + " "  + today.day.toString());
        
        if((now.day == i - startDate + 1) && (now.month == today.month) && (now.year == today.year)){
          print(now.toString());
          print(today.toString());
          rowDataData[i].today = true;
        }

        else {
          if(i + startDate - 1 < 35)
                  rowDataData[i].today = false;
          // print(i + startDate - 1);
        }

      }

    }

    void forwardyear(){
      setState(() {
        now = now.add(Duration(days: 365));
        startDate = now.weekday;
        populateData();
      });
  
    }

    void backwardyear(){
      setState(() {
        now = now.subtract(Duration(days: 365));
        startDate = now.weekday;
        populateData();
      });
  
    }

    void forwardmonth(){
      setState(() {
        now = now.add(Duration(days: 30));
        startDate = now.weekday;
        populateData();
      });
  
    }

    void backwardmonth(){
      setState(() {
        now = now.subtract(Duration(days: 30));
        startDate = now.weekday;
        populateData();
      });
  
    }

    @override
    void initState() {
      populateData();
      selection(21);
      // TODO: implement initState
      super.initState();
    }

  void selection(int i){
    setState(() {
      if(previoslySelected != null){
        rowDataData[previoslySelected].selected = false;
      }
      rowDataData[i].selected = true;
      previoslySelected = i;
      
      selectedDate = i - startDate + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      
      behavior: HitTestBehavior.opaque,
          child: Dialog(
        shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.only( bottomLeft: Radius.circular(52),)
          
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: _buildChild(context, rowDataData, now),
      ),
    );
  }

  _buildChild(BuildContext context, List<DayModel> rowDataData, EtDatetime now) {
    Size screensize = MediaQuery.of(context).size;


    return Container(

    decoration: BoxDecoration(
      color: Colors.teal[50],
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.only( bottomLeft: Radius.circular(52),)

    ),
    
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        
        Container(
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_left, color: Colors.teal), 
                  onPressed: (){
                    backwardyear();
                  },
                  ),
                  Spacer(),

              Center(child: Text(now.year.toString())),

              Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_right, color: Colors.teal,), 
                  onPressed: (){
                    forwardyear();
                  },
                  ),

            ],
          ),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
          ),
        ),


        Container(
          child: Center(
            child: Row(
              children: <Widget>[

                IconButton(
                  icon: Icon(Icons.arrow_left, color: Colors.teal), 
                  onPressed: (){
                    backwardmonth();
                  },
                  ),
                  Spacer(),

                Text(months[now.month -1]),

                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_right, color: Colors.teal,), 
                  onPressed: (){
                    forwardmonth();
                  },
                  ),


              ],
            )
            ),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border.symmetric(vertical: BorderSide(color:Colors.teal))
          ),
        ),

        Flexible(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.teal[100]
                  ),
                  children: [
                    Center(child: Text("ሰ")),
                    Center(child: Text("ማ")),
                    Center(child: Text("ረ")),
                    Center(child: Text("ሀ")),
                    Center(child: Text("አ")),
                    Center(child: Text("ቅ")),
                    Center(child: Text("እ")),
                    
                  ]
                ),

                TableRow(
                  children: [

                     for (int i = 0; i < startDate; i++)
                  InkWell(
                    
                      child: Container(
                        decoration: BoxDecoration(
                          color: rowDataData[i].today ? Colors.teal[100] : Colors.teal[50],
                           border: Border.all(
                            color: rowDataData[i].selected ? Colors.teal : Colors.teal[50],
                          )
                        ),
                        padding: EdgeInsets.symmetric(vertical:10),
                      
                      child: Text("", 
                      textAlign: TextAlign.center,
                      )
                    ),
                  ),
                    
                  for (int i = startDate ; i < 7; i++)
                  InkWell(
                    onTap: (){
                     
                      selection(i);
                    },
                      child: Container(
                        decoration: BoxDecoration(
                          color: rowDataData[i].today ? Colors.teal[100] : Colors.teal[50],
                           border: Border.all(
                            color: rowDataData[i].selected ? Colors.teal : Colors.teal[50],
                          )
                        ),
                        padding: EdgeInsets.symmetric(vertical:10),
                      
                      child: rowDataData[i].id == null ? Text("") : Text(rowDataData[i].id.toString(),  
                      textAlign: TextAlign.center,
                      )
                    ),
                  ),
                  
                  ]
                ),

                TableRow(
                  children: [
                    
                  for (int i = 7; i < 14; i++)
                  InkWell(
                    onTap: (){
                      selection(i);
                    },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical:10),
                      decoration: BoxDecoration(
                          color: rowDataData[i].today ? Colors.teal[100] : Colors.teal[50],
                           border: Border.all(
                            color: rowDataData[i].selected ? Colors.teal : Colors.teal[50],
                          )
                        ),
                      child: rowDataData[i].id == null ? Text("") : Text(rowDataData[i].id.toString(),  
                      textAlign: TextAlign.center,
                      )
                    ),
                  ),
                  
                  ]
                ),

                TableRow(
                  children: [
                    
                  for (int i = 14; i < 21; i++)
                  InkWell(
                    onTap: (){
                      selection(i);
                    },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical:10),
                      decoration: BoxDecoration(
                          color: rowDataData[i].today ? Colors.teal[100] : Colors.teal[50],
                           border: Border.all(
                            color: rowDataData[i].selected ? Colors.teal : Colors.teal[50],
                          )
                        ),
                      child: rowDataData[i].id == null ? Text("") : Text(rowDataData[i].id.toString(), 
                      textAlign: TextAlign.center,
                      )
                    ),
                  ),
                  
                  ]
                ),

                TableRow(
                  children: [
                    
                  for (int i = 21; i < 28; i++)
                  InkWell(
                    onTap: (){
                      selection(i);
                    },
                      child: Container(
                        decoration: BoxDecoration(
                          color: rowDataData[i].today ? Colors.teal[100] : Colors.teal[50],
                          border: Border.all(
                            color: rowDataData[i].selected ? Colors.teal : Colors.teal[50],
                          )
                        ),
                        padding: EdgeInsets.symmetric(vertical:10),
                      
                      child: rowDataData[i].id == null ? Text("") : Text(rowDataData[i].id.toString(), 
                      textAlign: TextAlign.center,
                      )
                    ),
                  ),
                  
                  ]
                ),

                TableRow(
                  children: [
                    
                  for (int i = 28; i < 35; i++)
                  InkWell(
                    onTap: rowDataData[i].id != null ? (){
                      selection(i);
                    } : null,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical:10),
                      decoration: BoxDecoration(
                          color: rowDataData[i].today ? Colors.teal[100] : Colors.teal[50],
                           border: Border.all(
                            color: rowDataData[i].selected ? Colors.teal : Colors.teal[50],
                          )
                        ),
                      child: rowDataData[i].id == null ? Text("") : Text(rowDataData[i].id.toString(), 
                      textAlign: TextAlign.center,
                      )
                    ),
                  ),

                  
                  
                  ]
                ),




                
              ],
            )
          ),
        ),


        
        Flexible(
                  child: Row(
            children: <Widget>[
              Spacer(),
              Container(
                child: FlatButton(
                  onPressed: (){
                    Navigator.pop(context, "");
                  }, 
                  child: Text("Cancel", style: TextStyle(color: Colors.teal),)
                  ),
              ),
              Container(
                child: FlatButton(
                  onPressed: (){
                    final tempdate = DateTime(now.year, now.month, selectedDate);
                    Navigator.pop(context, now != null ? tempdate.toString() : "");
                  }, 
                  child: Text("Submit", style: TextStyle(color: Colors.teal),)
                  ),
              ),
            ],
          ),
        )
      ],
    ),
  );
  }
}