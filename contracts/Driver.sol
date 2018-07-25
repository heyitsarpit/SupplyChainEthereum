pragma solidity ^0.4.18;

import "./Shipper_Exporter.sol";
import "./Shipper_Importer.sol";

contract Driver {

    function load(
        address exporter,
        string name,
        string description,
        uint load_weight,
        uint load_value
    ) public {
        Shipper_Exporter shipE = Shipper_Exporter(exporter);
        shipE.loadShipment(
         name,
         description,
        load_weight,
        load_value
        );
    }

    function ShipmentDelivered(
        address importer,
        uint shipment_id,
        uint unload_weight,
        uint load_date
    ) public payable{
        Shipper_Importer shipI = Shipper_Importer(importer);
        shipI.ShipmentDelivered(
        shipment_id,
        unload_weight,
        load_date
        );
    }
}

