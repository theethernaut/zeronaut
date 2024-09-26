// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import "hardhat/console.sol";

import "./Verifier.sol";
import {ILevel} from "zeronaut/contracts/interfaces/ILevel.sol";

contract Two is ILevel {
    UltraVerifier verifier;

    constructor(address _verifier) payable {
        verifier = UltraVerifier(_verifier);
    }

    function instructions() public pure returns (string memory) {
        return "If you played Ethernaut, you should know the password.";
    }

    function check(bytes calldata proof, bytes32[] calldata publicInputs) public view returns (bool) {
        return verifier.verify(proof, publicInputs);
    }

    function circuit() public pure returns (string memory) {
        return "{\"abi\":{\"parameters\":[{\"name\":\"key\",\"type\":{\"kind\":\"integer\",\"sign\":\"unsigned\",\"width\":32},\"visibility\":\"private\"},{\"name\":\"lock_1\",\"type\":{\"kind\":\"integer\",\"sign\":\"unsigned\",\"width\":32},\"visibility\":\"public\"},{\"name\":\"lock_2\",\"type\":{\"kind\":\"integer\",\"sign\":\"unsigned\",\"width\":32},\"visibility\":\"public\"}],\"return_type\":null,\"error_types\":{}},\"bytecode\":\"H4sIAAAAAAAA/+VYyW7CMBAdZ4GwqeLU3mr+wM4Cya33fkTVFCOh0nKAVuLnqxKwq8ENhypj1LRPirzgvHmehUEwOGK0f270nO0fX885WjNr7ek1hqfHOz0mYpqmahYrmchHERdlnok0K6e5zGWWZ/M4TxKVp/msKIuZKGSaKLnIimQhjqDk8hGXaAYZIl/ZYJYPRDNIQt0C6w3q9FOJduWIwAFvSJywLu4d0sdIgMOkDQl1XrLYCLlOiq0DLSs2I9rW2rRAQq3VA/fBZNCOYiHkEtivXT1G4DD5zM+Byhi3bPgOHdU0ESNCrh4hl/FnD/nTTjiKLlXFy3OQCy7iIxoCEKiLl1LnX+h0fWhhp+vXaG1Tp/Pgf3e6gR6HcIFOVxnjlo3f3OmGhFwjoO90I3Db6ap4UXc6z1F8REMAAnXxUuqstAWWTkBxsr84fTTvovlYj/dqx1/eNlv+ut7yUvFDAV2hg7f2wf2h+fJ9uVmWK8XLHV+tn54fDq9d//i1+Eur0dapiYNBhO72AbSxN37C/xcYWwH6vIO0MHotEt/Xh+8+GNf4J7K0Ye3n1hUmep9ZfBM4zSNf79l2GZp7iO/cGXaGZ1Cjc1yz9wmGu1kBdRUAAA=\"}";
    }
}
