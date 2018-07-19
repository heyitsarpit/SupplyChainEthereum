pragma solidity ^0.4.18;


contract Shipper_Exporter {

    struct Shipment {
        uint shipment_id;
        address exporter_id;
        address shipper_id;
        uint load_date;
        string name;
        string description;
        uint load_weight;
        uint load_value;
    }

    uint constant demmurage = 50;

    mapping(uint => Shipment) public shipments;
    uint shipment_counter;

    event LogShipment(
        uint indexed shipment_id,
        address indexed exporter_id,
        address indexed shipper_id,
        uint load_date,
        string name,
        string description,
        uint load_weight,
        uint load_value
    );

    function loadShipment(
        string _name,
        string _description,
        uint _load_weight,
        uint _load_value
    ) public {
        shipment_counter++;
        uint load_date = block.timestamp;
        shipments[shipment_counter] = Shipment(
            shipment_counter,
            msg.sender,
            0x0,
            load_date,
            _name,
            _description,
            _load_weight,
            _load_value

        );

        emit LogShipment(
            shipment_counter,
            msg.sender,
            0x0,
            load_date,
            _name,
            _description,
            _load_weight,
            _load_value
        );
    }

    function getNumberOfShipments() public view returns (uint) {
        return shipment_counter;
    }


    // function shipmentDamages(

    //     uint _load_weight,
    //     uint _unload_weight
    // ) public {
    //     //damages of 5$ per pound shipper must pay in case of damages
    //     var damages = ( _load_weight -  _unload_weight) * 5;
    // }

    // function demurrageClaim(
    //     uint _load_value
    // ) public {
    //     var demurrage = _load_value/3 ;
    // }

    // function ShipmentDelivery(
    //     string _name,
    //     string _description,
    //     uint _load_weight,
    //     uint _unload_weight,
    //     uint _load_value,
    //     uint _transport_charges

    // ) public {

    //     //if load delivered within 30 days of signing receipt rest half of payment to be made provided no damages.
    //     if(shipment_counter <= 30 && damages === 0)
    //     {

    //     }
    //     //else if within 30 days but some damages then percentage adjusted according to damages
    //     else if(shipment_counter <= 30 && damages !== 0 )
    //     {

    //     }

    //     //else if  30 days exceeded exporter must pay demurrage according to mutually agreed percentage
    //     else if(shipment_counter > 30 && damages === 0 )
    //     {

    //     }
    //     //else if 30 days limit exceeded and also other damages then further damages + demurrage applicable
    //     else if(shipment_counter > 30 && damages !== 0 )
    //     {

    //     }
    // }

}
