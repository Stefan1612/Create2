// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "hardhat/console.sol";
contract chainlinkPriceFeed {
    uint256 public constant toPayInUSD = 50 * 10e18;

    /* modifier minimunAmount(){
        require(x * uint256(oneEthInUSD) >= toPayInUSD, "Not enough funds");
        _;
    } */

    function getConversionRate() public view returns(int256 ){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
         (
            /*uint80 roundID*/,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        price = price * 10000000000;
        return price;
    }

    function enterWhatEver() public payable returns(uint x){
        int oneEthInUSD = getConversionRate();
         x = (msg.value * uint256(oneEthInUSD)) / 1000000000000000000;
     require(x  >= toPayInUSD, "Not enough funds"); 
        console.log("congratulations you've entered whatever");
       return  x ;
    }
    function getDecimals() public view returns (uint) {
          AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
        return priceFeed.decimals();
    }
}
