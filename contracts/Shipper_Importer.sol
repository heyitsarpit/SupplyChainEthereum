pragma solidity ^0.4.18;

import "./Shipper_Exporter.sol";

contract Shipper_Importer {
    struct Shipment {
        uint shipment_id;
        address importer;
        address shipper;
        string name;
        string description;
        uint unload_weight;
        uint load_value;
        uint transport_charges; //depend on unload_weight  
        uint miscellaneous_charges;  
    }

    uint constant transport_charges = 100;

    mapping(uint => Shipment) public shipments;
    uint shipment_counter;

    event unloadLogShipment(
        uint indexed shipment_id,
        address indexed importer,
        address indexed shipper,
        uint payment
    );

    function shipmentDamages(
        uint _load_weight,
        uint _unload_weight
    ) private returns (uint){
        //damages of 2$ per gallon shipper must pay in case of damages
        uint damages_price = (_load_weight - _unload_weight) * 5;
        return damages_price;
    }

    function demurrageClaim(
        uint time_hours
    ) private returns (
        uint
    ){
        uint demurrage_cost = time_hours * 2;
        //0.2 ether
        return demurrage_cost;
    }

    function ShipmentDelivered(
        uint shipment_id,
        uint unload_weight,
        uint load_date
    ) public payable{
        uint load_weight;  //pulled through web3
        uint unload_date = block.timestamp;
        uint time_days = (unload_date - load_date) / 60 / 60 / 24;//  emit unloadLogShipment//  emit unloadLogShipment(
        uint time_exceeded_hours = (time_days - 30) * 24;
        uint payment = transport_charges;
        //if load delivered within 30 days of signing receipt full payment to be made provided no damages.
        if (time_days <= 30 && unload_weight == load_weight) {
            payment += 0;
        }
        //else if within 30 days but some damages then percentage adjusted according to damages
        else if (shipment_counter <= 30 && unload_weight < load_weight) {
            payment += shipmentDamages(load_weight, unload_weight);
        }
        //else if  30 days exceeded exporter must pay demurrage according to mutually agreed percentage
        else if (shipment_counter > 30 && unload_weight == load_weight) {
            payment += demurrageClaim(time_exceeded_hours);
        }
        //else if 30 days limit exceeded and also other damages then further damages + demurrage applicable
        else if (shipment_counter > 30 && unload_weight < load_weight) {
            payment += demurrageClaim(time_exceeded_hours) + shipmentDamages(load_weight, unload_weight);
        }

        emit unloadLogShipment(
            shipment_id,
            msg.sender,
            0x0,
            payment
        );
    }
}