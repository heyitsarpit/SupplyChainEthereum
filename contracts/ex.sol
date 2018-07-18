pragma solidity ^0.4.18;

contract Shipper_Carrier {
    struct shipment {
        uint shipment_id;
        address carrier_id;
        address shipper_id;
        string name;
        string description;
        uint load_weight;
        uint load_value;
        uint transport_charges; //depend on load_weight
        uint demurrage_rates; //depend on load_value
    }

    event LogShipment(
        uint indexed shipment_id,
        address indexed carrier_id,
        address indexed shipper_id,
        string name,
        string description,
        uint load_weight,
        uint load_value,
        uint transport_charges,
        uint demurrage_rates
    );

    function loadShipment(
        uint _shipment_id,
        address _carrier_id,
        address _shipper_id,
        string _name,
        string _description,
        uint _load_weight,
        uint _load_value,
        uint _transport_charges,
        uint _demurrage_rates
    ) public {


        //shipper pay carrier half of transport cost…. receipt generated (event 1)
        //assets loaded onto ship
    }

    function shipmentDamages() public {
        //risk insurance of 5$ per pound carrier must pay in case of damages
    }

    function ShipmentDelivery() public {
        //if load delivered within 30 days of signing receipt rest half of payment to be made provided no damages.
        //else if within 30 days but some damages then rates adjusted according to damages
        //else if  30 days exceeded carrier must pay demurrage according to mutually agreed rates
        //else if 30 days limit exceeded and also other damages then further damages + demurrage applicable
    }

}
