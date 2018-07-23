App = {
    web3Provider: null,
    contracts: {},
    account: 0x0,
    loading: false,

    init: () => {
        return App.initWeb3();
    },

    initWeb3: () => {
        // initialize web3
        if (web3) {
            //reuse the provider of the Web3 object injected by Metamask
            App.web3Provider = web3.currentProvider;
        } else {
            //create a new provider and plug it directly into our local node
            App.web3Provider = new Web3.providers.HttpProvider(
                'http://localhost:7545'
            );
        }
        web3 = new Web3(App.web3Provider);

        return App.initContract();
    },

    initContract: () =>{
        $.getJSON('Shipper_Exporter.json', artifact => {
            // get the contract artifact file and use it to instantiate a truffle contract abstraction
            App.contracts.Shipper_Exporter = TruffleContract(artifact);
            // set the provider for our contracts
            App.contracts.Shipper_Exporter.setProvider(App.web3Provider);
            // listen to events
            App.listenToEvents();
        });
    },
    listenToEvents: () => {
        App.contracts.Shipper_Exporter.deployed().then(instance => {
            instance.LogShipment({}, {}).watch((error, event) => {
                if (!error) {
                    console.log(
                        '<li class="list-group-item">' +
                            event.args.shipemnt_counter +
                            event.args.exporter_id +
                            event.args.shipper_id +
                            event.args.load_date +
                            event.args.name +
                            event.args.description +
                            event.args.load_weight +
                            event.args.load_value +
                            '</li>'
                    );
                } else {
                    console.error(error);
                }
            });
        });
    },

    loadShipment: () => {
        event.preventDefault();
        var _name = $(event.target).data('name');
        var _description = $(event.target).data('description');
        var _load_weight = $(event.target).data('load_weight');
        var _load_value = $(event.target).data('load_value');

        App.contracts.Shipper_Exporter.deployed()
            .then(instance => {
                return instance.loadShipment(
                    _name,
                    _description,
                    _load_weight,
                    _load_value,
                    {
                        from: App.account,
                        value: web3.toWei(10, 'ether'),
                        gas: 500000
                    }
                );
            })
            .catch(error => {
                console.error(error);
            });
    }
};

$(() => {
    $(window).load(() => {
        App.init();
    });
});
