// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./UniswapLiteBase.sol";

contract MyDapp is UniswapLiteBase {
    address constant daiAddress = 0xc707Fd5a456eec2609463F7fEa79756356F0A754;

    function getEthPriceInDai() public view returns (uint256 tokenAmount) {
        return _getEthToTokenInput(daiAddress, 1000 ether);
    }

    function swapEthToDai() external payable returns (uint256 tokensBought) {
        uint256 amount = _ethToToken(daiAddress, msg.value);
        IERC20(daiAddress).transfer(msg.sender, amount);
        return amount;
    }
}
