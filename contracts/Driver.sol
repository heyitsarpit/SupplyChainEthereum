pragma solidity ^0.4.18;

import "./Shipper_Exporter.sol";
import "./Shipper_Importer.sol";

contract Driver {

    uint pay;
    address expo;
    address impo;
    uint load_value;

    function load(
        address exporter,
        string name,
        string description,
        uint load_weight,
        uint _load_value
    ) public {
        Shipper_Exporter shipE = Shipper_Exporter(exporter);
        expo = shipE.getAddress();
        shipE.loadShipment(
            name,
            description,
            load_weight,
            _load_value
        );
        load_value = _load_value;
    }

    function ShipmentDelivered(
        address importer,
        uint shipment_id,
        uint unload_weight,
        uint load_date
    ) public payable {
        Shipper_Importer shipI = Shipper_Importer(importer);
        impo = shipI.getAdrress();
        pay = shipI.ShipmentDelivered(
            shipment_id,
            unload_weight,
            load_date
        );


    }

}

