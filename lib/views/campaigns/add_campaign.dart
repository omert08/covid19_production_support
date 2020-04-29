import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AddCampaignView extends StatefulWidget {
  @override
  _AddCampaignViewState createState() => _AddCampaignViewState();
}

class _AddCampaignViewState extends State<AddCampaignView> {

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String _campaignName;
String _productionType = '';
int _productionQuantity;
String _deliveryAdress;
String _fileURL;
List<String> _campaignTypes = ['Shelter', 'Mask', 'Ventilator', 'Others'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Campaign').tr(),
        elevation: 0.0,
        backgroundColor: Colors.redAccent,
        ),
      body: Container(
        margin: EdgeInsets.all(24),
        child:Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildCampaignName(),
              _buildProductionType(),
              _buildProductionQuantity(),
              _buildDeliveryAdress(),
              _buildFilesUrl(),
              _buildSubmitButton()

              
            ]
          ),
        
        ),
      )
      
    );
  }

  _buildCampaignName() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Campaign Name'.tr()),

      validator: (String value) {
        if (value.isEmpty) {
          return 'Campaign name is required'.tr();
        }

        return null;
      },
      onSaved: (String value) {
        _campaignName = value;
      },
    );
  }
  _buildProductionType(){
    return DropdownButton<String>(
      isExpanded: true,
      icon: Icon(Icons.arrow_downward),
      hint: Text('Please select a material type').tr(),
      onChanged: (String newValue) {
        setState(() {
          _productionType = newValue;
          
        });
      },

      items: _campaignTypes.map((String value) {
        return new DropdownMenuItem<String>(
        
          value: _productionType,
          child: new Text(value).tr(),
        );
      }).toList(),
      
    );
  }

  _buildProductionQuantity(){
      return TextFormField(
      decoration: InputDecoration(hintText: 'Production Quantity'.tr()),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Production quantity is required'.tr();
        }
        if (!_isNumeric(value)){
          return 'Production quantity should be numeric value'.tr();
        }

        return null;
      },
      onSaved: (String value) {
        _productionQuantity = int.parse(value);
      },
    );
  }

  _buildDeliveryAdress(){
      return TextFormField(
      decoration: InputDecoration(hintText: 'Delivery Adress'.tr()),

      validator: (String value) {
        if (value.isEmpty) {
          return 'Delivery Adress is required'.tr();
        }

        return null;
      },
      onSaved: (String value) {
        _deliveryAdress = value;
      },
    );
  }

  _buildFilesUrl(){
      return TextFormField(
      decoration: InputDecoration(hintText: 'File Url Adress'.tr()),

      validator: (String value) {
        if (value.isEmpty) {
          return 'File URL adress is required'.tr();
        }

        return null;
      },
      onSaved: (String value) {
        _fileURL = value;
      },
    );
  }

  _buildSubmitButton(){
    return RaisedButton(
          child: Text(
          'Submit'.tr(),
          style: TextStyle(color: Colors.redAccent, fontSize: 16),
        ),
        onPressed: (){
        if (!_formKey.currentState.validate())
        {
          return;
        }
       _formKey.currentState.save(); 
      }
    );
  }

  _buildSelectState(){
    return DropdownButton<String>(
      isExpanded: true,
      icon: Icon(Icons.arrow_downward),
      hint: Text('Please select a material type').tr(),
      onChanged: (String newValue) {
        setState(() {
          _productionType = newValue;
          
        });
      },

      items: _campaignTypes.map((String value) {
        return new DropdownMenuItem<String>(
        
          value: _productionType,
          child: new Text(value).tr(),
        );
      }).toList(),
      
    );
  }
  

  bool _isNumeric(String str) {
    if(str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

}