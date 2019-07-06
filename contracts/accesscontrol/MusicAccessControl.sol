/// @title A facet of KittyCore that manages special access privileges.
/// @author Axiom Zen (https://www.axiomzen.co)
/// @dev See the KittyCore contract documentation to understand how the various contract facets are arranged.

contract MusicAccessControl {

    // Composer role: create music 
    // Musician role: plays music
    // Producer role: produce music
    // Distributor role: distribute music
    // Consumer role: consume music


    /// @dev Emited when contract is upgraded - See README.md for updgrade plan
    event ContractUpgrade(address newContract);

    // The addresses of the accounts (or contracts) that can execute actions within each roles.

    address public admAddress;
    address public composerAddress;
    address public musicianAddress;
    address public producerAddress;
    address public distributorAddress;
    address public consumerAddress;

    // @dev Keeps track whether the contract is paused. When that is true, most actions are blocked
    bool public paused = false;


        /// @dev Access modifier for ADM-only functionality
    modifier onlyAdm() {
        require(msg.sender == admAddress);
        _;
    }
        /// @dev Access modifier for Composer-only functionality
    modifier onlyComposer() {
        require(msg.sender == composerAddress);
        _;
    }

    /// @dev Access modifier for Musician-only functionality
    modifier onlyMusician() {
        require(msg.sender == musicianAddress);
        _;
    }

    /// @dev Access modifier for Producer-only functionality
    modifier onlyProducer() {
        require(msg.sender == producerAddress);
        _;
    }
        /// @dev Access modifier for Distributor-only functionality
    modifier onlyDistributor() {
        require(msg.sender == distributorAddress);
        _;
    }

    /// @dev Access modifier for Consumer-only functionality
    modifier onlyConsumer() {
        require(msg.sender == consumerAddress);
        _;
    }

    modifier onlyCLevel() {
        require(
            msg.sender == admAddress ||
            msg.sender == composerAddress ||
            msg.sender == musicianAddress
        );
        _;
    }

        /// @dev Assigns a new address to act as the Adm. Only available to the current Adm.
    /// @param _newAdm The address of the new Adm
    function setAdm(address _newAdm) external onlyAdm {
        require(_newAdm != address(0));

        admAddress = _newAdm;
    }

    /// @dev Assigns a new address to act as the Composer. Only available to the current Adm.
    /// @param _newComposer The address of the new Composer
    function setComposer(address _newComposer) external onlyAdm {
        require(_newComposer != address(0));

        composerAddress = _newComposer;
    }

       /// @dev Assigns a new address to act as the Musician. Only available to the current Adm.
    /// @param _newMusician The address of the new Musician
    function setMusician(address _newMusician) external onlyAdm {
        require(_newMusician != address(0));

        musicianAddress = _newMusician;
    }

       /// @dev Assigns a new address to act as the Producer. Only available to the current Adm.
    /// @param _newProducer The address of the new Producer
    function setProducer(address _newProducer) external onlyAdm {
        require(_newProducer != address(0));

        producerAddress = _newProducer;
    }

       /// @dev Assigns a new address to act as the Distributor. Only available to the current Adm.
    /// @param _newDistributor The address of the new Distributor
    function setDistributor(address _newDistributor) external onlyAdm {
        require(_newDistributor != address(0));

        distributorAddress = _newDistributor;
    }

       /// @dev Assigns a new address to act as the Consumer. Only available to the current Adm.
    /// @param _newConsumer The address of the new Consumer
    function setConsumer(address _newConsumer) external onlyAdm {
        require(_newConsumer != address(0));

        consumerAddress = _newConsumer;
    }


    /*** Pausable functionality adapted from OpenZeppelin ***/

    /// @dev Modifier to allow actions only when the contract IS NOT paused
    modifier whenNotPaused() {
        require(!paused);
        _;
    }

    /// @dev Modifier to allow actions only when the contract IS paused
    modifier whenPaused {
        require(paused);
        _;
    }

    /// @dev Called by any "C-level" role to pause the contract. Used only when
    ///  a bug or exploit is detected and we need to limit damage.
    function pause() external onlyCLevel whenNotPaused {
        paused = true;
    }

    /// @dev Unpauses the smart contract. Can only be called by the CEO, since
    ///  one reason we may pause the contract is when CFO or COO accounts are
    ///  compromised.
    /// @notice This is public rather than external so it can be called by
    ///  derived contracts.
    function unpause() public onlyAdm whenPaused {
        // can't unpause if contract was upgraded
        paused = false;
    }
}