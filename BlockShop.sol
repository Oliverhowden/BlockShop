pragma solitity ^0.4.19;

// The BlockShop
contract BlockShop {

  function onlyOwner(){
    require (msg.sender == owner);
  }
  function notOwner(){
    require(msg.sender != owner);
  }

  function BlockShop(){
    owner = msg.sender;
  }

  address owner;
  uint itemId = 0;
  mapping (string => uint) itemNameToId;
  mapping (uint => address) itemIdToOwner;
  mapping (uint => uint) itemIdToPrice;

  /**
  @dev creates a new item on the item stack
  @param _itemName string of item name
  @param _itemPrice desired price of itemId
  @param returns itemId
  **/
  function createItem(string _itemName, uint _itemPrice) returns (uint){
    uint _newItemId = newItemId();
    itemNameToId[_itemName] = _newItemId;
    setItemOwner(_newItemId);
    setItemPrice(_newItemId, _itemPrice);

    return _newItemId
  }

  //@dev sets itemid to contract caller
  function setItemOwner(uint _itemId) private {
    itemIdToOwner[_itemId] = msg.sender;
  }
  //@dev sets itemPrice to contract desired
  function setItemPrice(uint _itemId, uint _price) {
    require(msg.sender == itemIdToOwner[_itemId]);
    itemIdToPrice[_itemId] = _price;
  }
//@dev returns the previous itemId + 1
  function newItemId() returns (uint){
    return (itemId + 1)
  }
}

//Handles the buying and selling
contract BuyNSell is BlockShop  {

  function buyItem(uint _itemId) payable {
    require(msg.sender != itemIdToOwner[_itemId]);

  }

}
