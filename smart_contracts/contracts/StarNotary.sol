pragma solidity ^0.4.23;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721.sol';

contract StarNotary is ERC721 {

    struct Star {
        string name;
        string dec;
        string mag;
        string cent;
        string story;
    }

    mapping(uint256 => Star) public tokenIdToStarInfo;
    mapping(uint256 => uint256) public starsForSale;
    mapping(bytes32 => bool) public starExists;

    /**
    * @dev Private function to generate a starHash given it's coordinates
    * @param _dec string The Star's declination
    * @param _mag string The Star's magnitude
    * @param _cent string The Star's Cent
    * @return starHash
    */
    function getStarHash(string _dec, string _mag, string _cent)
        private
        pure
        returns (bytes32)
    {
        return keccak256(abi.encodePacked(_dec, _mag, _cent));
    }

    /**
    * @dev Public view function to check if a star exists given it's coordinates
    * @param _dec string The Star's declination
    * @param _mag string The Star's magnitude
    * @param _cent string The Star's Cent
    * @return bool
    */
    function checkIfStarExist(string _dec, string _mag, string _cent)
        public
        view
        returns (bool)
    {
        return starExists[getStarHash(_dec, _mag, _cent)];
    }

    /**
    * @dev Public function to create & register a Star
    * @param _name string optional The Star's name
    * @param _dec string The Star's declination
    * @param _mag string The Star's magnitude
    * @param _cent string The Star's Cent
    * @param _story string optional Story behind the star
    * @param _tokenId uint256 ID of the token to be minted by the msg.sender
    */
    function createStar(string _name, string _dec, string _mag, string _cent,
                        string _story, uint256 _tokenId)
        public
    {
        // input validations
        require(bytes(_dec).length != 0 &&
                bytes(_mag).length != 0 &&
                bytes(_cent).length != 0 &&
                _tokenId != 0);

        // check if tokenId already exists
        require(bytes(tokenIdToStarInfo[_tokenId].dec).length == 0);

        // star should not be already taken
        require(!checkIfStarExist(_dec, _mag, _cent));

        // create in-memory star from input params
        Star memory newStar = Star(_name, _dec, _mag, _cent, _story);

        // save star in mapping for easy details access via tokenId
        tokenIdToStarInfo[_tokenId] = newStar;
        // mark star as taken
        starExists[getStarHash(_dec, _mag, _cent)] = true;

        // mint ERC721 token for caller
        _mint(msg.sender, _tokenId);
    }

    function putStarUpForSale(uint256 _tokenId, uint256 _price)
        public
    {
        require(this.ownerOf(_tokenId) == msg.sender);

        starsForSale[_tokenId] = _price;
    }

    function buyStar(uint256 _tokenId)
        public
        payable
    {
        require(starsForSale[_tokenId] > 0);

        uint256 starCost = starsForSale[_tokenId];
        address starOwner = this.ownerOf(_tokenId);
        require(msg.value >= starCost);

        _removeTokenFrom(starOwner, _tokenId);
        _addTokenTo(msg.sender, _tokenId);

        starOwner.transfer(starCost);

        if(msg.value > starCost) {
            msg.sender.transfer(msg.value - starCost);
        }
    }
}