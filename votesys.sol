// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract votesys{
    struct candidate{
        uint id;
        string name;
        uint votecount;

    }
    mapping(uint => candidate) public candidates;
    mapping(address => bool) public voters;
    uint public candcount;
    event votedevent(
        uint indexed candid
    );
    constructor() public{
        addcand("candidate 1");
        addcand("candidate 2");
        addcand("candidate 3");

    }
    function addcand(string memory name) private {
        candcount++;
        candidates[candcount] = candidate(candcount, name, 0);

    }
    function vote(uint candid) public {
        require(!voters[msg.sender]);
        require(candid > 0 && candid <= candcount);
        candidates[candid].votecount++;



        voters[msg.sender]= true;

    }
    
    function winner() public view returns(string memory){
        
        uint max =  1;
        for(uint i = 1; i < candcount + 1; i++){
            
            if (candidates[i].votecount>candidates[max].votecount){
                
                max = i;
            }

        }   
        
        return candidates[max].name;
        

    }


}