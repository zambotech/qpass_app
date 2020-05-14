import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'model/pass_holder.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({
    Key key,
    this.passHolder,
    this.isVerified
  }) : super(key: key);
  final PassHolder passHolder;
  final bool isVerified;
  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        width: width,
        height: heigth / (widget.isVerified ? 2 : 4),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [ 0.0005, 1.9 ],
            colors: [
              Theme.of(context).accentColor.withOpacity(0.6),
              Theme.of(context).primaryColor.withOpacity(0.3), ]),
          borderRadius: BorderRadius.only(
            topLeft: Platform.isIOS ? Radius.elliptical(200, 100) : Platform.isAndroid ? Radius.elliptical(200, 100) : Radius.circular(10.0),
            topRight: Platform.isIOS ? Radius.circular(10.0) : Platform.isAndroid ? Radius.circular(10.0) : Radius.elliptical(200, 100),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          )
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 10,
              left: Platform.isIOS ? 10 : Platform.isAndroid ? 10 : null,
              right: Platform.isIOS ? null : Platform.isAndroid ? null : 10,
              child: GestureDetector(
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 30,
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),
            !widget.isVerified ? Container() : Positioned(
              top: 10,
              right: 10,
              child: CircleAvatar(
                child: Text(
                  widget.passHolder.barangay.type,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              )
            ),
            Positioned(
              top: widget.isVerified ? 50 : heigth / 11,
              left: 50,
              right: 50,
              child: Column(
                children: <Widget>[
                  Text( widget.isVerified ? 'QPass Holder Details' : 'WARNING',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Platform.isAndroid ? heigth / 50 : heigth / 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text( widget.isVerified ? 'VERIFIED' : 'NOT-VERIFIED',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: widget.isVerified ? Colors.green : Colors.red,
                      fontSize: heigth / 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ),
            Positioned(
              top: 120,
              left: 20,
              right: 20,
              bottom: 00,
              child: Container(
                child: widget.isVerified ? verifiedQPass(heigth) : Container(),
              )
            )
          ],
        )
      ),
    );
  }

  ListView verifiedQPass(double heigth) {
    return ListView(
      primary: false,
      children: <Widget>[
        Text( 'Primary',
          style: TextStyle(
            color: Colors.black,
            fontSize: Platform.isAndroid ? heigth / 50 : heigth / 44,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text( 
          " " + widget.passHolder.primaryFirstName
          + (widget.passHolder.primaryMiddleName != "" ? " " : "" ) + widget.passHolder.primaryMiddleName
          + " " + widget.passHolder.primaryLastName,
          style: TextStyle(
            fontSize: heigth / 36,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        
        SizedBox(height: 10,),

        Text( 'Secondary',
          style: TextStyle(
            color: Colors.black,
            fontSize: Platform.isAndroid ? heigth / 50 : heigth / 44,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text( 
          " " + widget.passHolder.secondaryFirstName
          + (widget.passHolder.secondaryMiddleName != "" ? " " : "" ) + widget.passHolder.secondaryMiddleName
          + " " + widget.passHolder.secondaryLastName,
          style: TextStyle(
            fontSize: heigth / 36,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        
        SizedBox(height: 10,),
        
        Text( 'Barangay',
          style: TextStyle(
            color: Colors.black,
            fontSize: Platform.isAndroid ? heigth / 50 : heigth / 44,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text( ' ${widget.passHolder.barangay.name}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),

        SizedBox(height: 10,),

        Text( 'Street',
          style: TextStyle(
            color: Colors.black,
            fontSize: Platform.isAndroid ? heigth / 50 : heigth / 44,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text( widget.passHolder.street != "" ? ' ${widget.passHolder.street}' : " N/A",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        
        SizedBox(height: 10,),
        
        Text( 'Contact #',
          style: TextStyle(
            color: Colors.black,
            fontSize: Platform.isAndroid ? heigth / 50 : heigth / 44,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text( widget.passHolder.contactNumber != "" ? " ${widget.passHolder.contactNumber}" : " N/A",
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ],
    );
  }
}
