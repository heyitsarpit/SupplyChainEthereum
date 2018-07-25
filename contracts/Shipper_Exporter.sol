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

    uint loadWeight;

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

    function getAddress() public returns (address)  {
        return msg.sender;
    }

    function loadShipment(
        string _name,
        string _description,
        uint load_weight,
        uint load_value
    ) public {
        shipment_counter = block.number;
        uint load_date = block.timestamp;
        loadWeight = load_weight;
        shipments[shipment_counter] = Shipment(
            shipment_counter,
            msg.sender,
            0x0,
            load_date,
            _name,
            _description,
            load_weight,
            load_value

        );

        emit LogShipment(
            shipment_counter,
            msg.sender,
            0x0,
            load_date,
            _name,
            _description,
            load_weight,
            load_value
        );
    }
   
    uint public balance = 0;
    event recieve(uint value);
    
    function () private payable{
        emit recieve(msg.value);
    }

    function getNumberOfShipments() public view returns (uint) {
        return shipment_counter;
    }
}
