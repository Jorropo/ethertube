pragma solidity >=0.5.0 <0.6.0;

contract Ethertube {

    // This is just to allow client to check for a new version and is just informative.
    uint64 public clientVersion;
    string public clientIpfs;
    address public owner;
    // This is just an ipfs provider provided by the admin to download new version if current one isn't update.
    string public devIpfsProvider;

    // This is the video storage part
    struct Video {
        string name;
        // The uint8 is resolution of the video
        // Bytes is Ipfs cid of the video.
        mapping(uint8 => bytes) cids;
        uint256 likes;
        uint256 dislike;
        uint256[10] categorys;
        address owner;
    }
    mapping(uint256 => Video) public videos;
    uint256 public videosCount;
    mapping(address => mapping(uint256 => uint8)) public likes;
    // This is the category storage part
    struct Category {
        string name;
        string description;
        bool NSFW;
        bool reserved;
        address owner;
    }
    mapping(uint256 => Category) public categorys;
    uint256 public categorysCount;
    // I don't want to many category so makes category payable is a good way to contain that
    uint256 public categoryPrice;
    address public charityAddress;
    uint8 public charityPercent;
    string public charityName;

    constructor(string memory _charityName, uint256 _categoryPrice, address _charityAddress, uint8 _charityPercent) public {
        owner = msg.sender;
        videosCount = 0;
        categorysCount = 1;
        categorys[0] = Category("Nothing", "This category is just to allow user to set a category to empty.", false, false, owner);
        categoryPrice = _categoryPrice;
        charityAddress = _charityAddress;
        charityPercent = _charityPercent;
        charityName = _charityName;
    }

    modifier onlyOwner() {
        assert(msg.sender == owner);
        _;
    }
    function transferOwnership(address newOwner) external onlyOwner {
        if (newOwner != address(0)) {
            owner = newOwner;
        }
    }
    function newVersion(uint64 _clientVersion, string calldata _clientIpfs) external onlyOwner {
        clientVersion = _clientVersion;
        clientIpfs = _clientIpfs;
    }
    function updateIpfsProvider(string calldata _devIpfsProvider) external onlyOwner {
        devIpfsProvider = _devIpfsProvider;
    }
    function updateCategoryPrice(uint256 _categoryPrice) external onlyOwner {
        categoryPrice = _categoryPrice;
    }
    function updateCharityAddress(address _charityAddress) external onlyOwner {
        charityAddress = _charityAddress;
    }
    function updateCharityPercent(uint8 _charityPercent) external onlyOwner {
        charityPercent = _charityPercent;
    }

    function updateResolution(uint256 _video, uint8 _resolution, bytes calldata _cid) external {
        Video storage v = videos[_video];
        if(v.owner == msg.sender){

        } else {

        }
    }
    function addVideo(string calldata _name, uint8[] calldata _resolutions, bytes calldata _cid, uint256[10] calldata _categorys) external {

    }
}
