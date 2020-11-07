pragma solidity >=0.4.0 <0.7.0;
pragma experimental ABIEncoderV2;

contract VolleyballTeam {
    
    struct Player {
        string name;
        uint jerseyNumber;
        uint age;
        string nationality;
        string playingPosition;
    }
    
    mapping (address => Player) public players;
    
    Player[] public playerList;
    
    function setPlayer(string memory name, uint jerseyNumber, uint age, string memory nationality, string memory playingPosition) public {
        address creator = msg.sender;
        
        Player memory newPlayer;
        newPlayer.name = name;
        newPlayer.jerseyNumber = jerseyNumber;
        newPlayer.age = age;
        newPlayer.nationality = nationality;
        newPlayer.playingPosition = playingPosition;
        
        players[creator] = newPlayer;
        playerList.push(newPlayer);
        
    }
    
    function getPlayer() public view returns (string memory name, uint jerseyNumber, uint age, string memory nationality, string memory playingPosition) {
        address creator = msg.sender;
        return (players[creator].name, players[creator].jerseyNumber, players[creator].age, players[creator].nationality, players[creator].playingPosition);
    }
    
    function getPlayerList()  public view returns (Player [] memory) {

        return playerList;

    }
    
}
