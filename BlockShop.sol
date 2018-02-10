pragma solitity ^0.4.19;

// The BlockShop
contract BlockShop {

  address owner;
  uint itemId = 0;
  mapping (string => uint) itemNameToId;

  function BlockShop(){
    owner = msg.sender;
  }
  function createItem(string itemName) returns (uint){
    itemNameToId[itemName] = newItemId()
  }

//@dev returns the previous itemId + 1
  function newItemId() returns (itemId){
    return (itemId + 1) 
  }
}

//Handles the buying and selling
contract BuynSell is BlockShop {

  function buy(uint item, uint price, uint buyer, uint seller) {

  }
}
