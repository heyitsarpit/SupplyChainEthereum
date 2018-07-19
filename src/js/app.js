App = {
  web3Provider: null,
  contracts: {},
  account: 0x0,
  loading: false,

  init: function() {
    return App.initWeb3();
  },

  initWeb3: function() {
    // initialize web3
    if(typeof web3 !== 'undefined') {
      //reuse the provider of the Web3 object injected by Metamask
      App.web3Provider = web3.currentProvider;
    } else {
      //create a new provider and plug it directly into our local node
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
    }
    web3 = new Web3(App.web3Provider);

    App.displayAccountInfo();

    return App.initContract();
  },

  displayAccountInfo: function() {
    
  },

  initContract: function() {
    
  },

  reloadArticles: function() {
   
  },

  displayArticle: function(id, seller, name, description, price) {
    
  },

  sellArticle: function() {
   
  },

  // listen to events triggered by the contract
  listenToEvents: function() {
    
  },

  buyArticle: function() {
    
};

$(function() {
  $(window).load(function() {
    App.init();
  });
});
