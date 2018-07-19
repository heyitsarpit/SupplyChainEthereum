pragma solidity ^0.4.18;


contract Shipper_Importer {
    struct Shipment {
        uint shipment_id;
        address importer_id;
        address shipper_id;
        string name;
        string description;
        uint unload_weight;
        uint load_value;
        uint transport_charges; //depend on unload_weight    
    }
    uint constant transport_charges = unload_weight * 0.001;

    mapping(uint => Shipment) public shipments;
    uint shipment_counter;

    event unloadLogShipment(
        uint indexed shipment_id,
        address indexed importer_id,
        address indexed shipper_id,
        string name,
        string description,
        uint unload_weight,
        uint load_value,
        uint transport_charges
      
    );

    // function unloadShipment(
        
    //     uint _unload_weight,
    //     uint _load_value,
    //     uint _transport_charges
        
    // ) public {
       
    //     emit LogShipment(
    //         shipment_counter,
    //         msg.sender,
    //         0x0,
    //         _name,
    //         _description,
    //         _unload_weight,
    //         _load_value,
    //         _transport_charges
    //         );
    // }


//}
 function shipmentDamages(
        uint _load_weight,
        uint _unload_weight
    ) public {
        //damages of 2$ per gallon shipper must pay in case of damages
        uint damages_price = (_load_weight -  _unload_weight) * 0.005;
        return  damages_price;
    }

    function demurrageClaim(
        uint _load_value
    ) public {
        uint demurrage_percent = _load_value/3 ;
        return  demurrage_percent;
    }

function ShipmentDelivery(
        
        uint _load_weight,
        uint _unload_weight,
        uint _load_value,
        uint _transport_charges

    ) public {

        //if load delivered within 30 days of signing receipt full payment to be made provided no damages.
        if(shipment_counter <= 30 && unload_weight = load_weight)
        {
        

        }
        //else if within 30 days but some damages then percentage adjusted according to damages
        else if(shipment_counter <= 30 && unload_weight < load_weight )
        {

        }
        
        //else if  30 days exceeded exporter must pay demurrage according to mutually agreed percentage
        else if(shipment_counter > 30 && unload_weight = load_weight )
        {
            
        }
        //else if 30 days limit exceeded and also other damages then further damages + demurrage applicable
        else if(shipment_counter > 30 && unload_weight < load_weight )
        {

        }
        else if (unload_weight > load_weight){

        }
        emit unloadLogShipment(
            msg.sender,
            0x0,
            _name,
            _description,
            _unload_weight,
            _load_value,
            _transport_charges
        );
    }
