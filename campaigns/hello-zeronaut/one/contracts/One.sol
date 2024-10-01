// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import "hardhat/console.sol";

import "./Verifier.sol";
import {ILevel} from "zeronaut/contracts/interfaces/ILevel.sol";
import {Zeronaut} from "zeronaut/contracts/Zeronaut.sol";

contract One is ILevel {
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
        return "{\"abi\":{\"parameters\":[{\"name\":\"password\",\"type\":{\"kind\":\"string\",\"length\":8},\"visibility\":\"private\"},{\"name\":\"signature\",\"type\":{\"kind\":\"array\",\"length\":64,\"type\":{\"kind\":\"integer\",\"sign\":\"unsigned\",\"width\":8}},\"visibility\":\"private\"},{\"name\":\"pubKeyX\",\"type\":{\"kind\":\"array\",\"length\":32,\"type\":{\"kind\":\"integer\",\"sign\":\"unsigned\",\"width\":8}},\"visibility\":\"public\"},{\"name\":\"pubKeyY\",\"type\":{\"kind\":\"array\",\"length\":32,\"type\":{\"kind\":\"integer\",\"sign\":\"unsigned\",\"width\":8}},\"visibility\":\"public\"},{\"name\":\"hashedMsg\",\"type\":{\"kind\":\"array\",\"length\":32,\"type\":{\"kind\":\"integer\",\"sign\":\"unsigned\",\"width\":8}},\"visibility\":\"private\"}],\"return_type\":null,\"error_types\":{}},\"bytecode\":\"H4sIAAAAAAAA/7WXZW/bVxhH/1k6ZuYtXQcZ27Ed26Om6yBjZgrZy5iZMmzHzJRho33K5cj3p3XnRd/UtmTdHEVyrhz7POcZqwaPtfXnP+XnsfXn+Ppzn/IM7yveT7y/+ADxgeKDxAeLDxEfKj5MfLj4CPGR4qPER4uPER8rPk58vPgE8Ynik8QniyfEG8WniDeJTxWfJj5dfIZ4Unym+Czx2eJzxOeKzxOfL66J6+IpcUPcFLfE0+K2uCPuii8QXyi+SHyx+BLxZvGMeIv4UvFW8WXiy8VXiK8Uz4qvEl8tvkZ8rfg68fXiG8Q3im8S3yy+RXyr+Dbx7eI7xHeK7xLfLb5HfK/4PvH94gfEc+J58YJ4Ubwk7on74gfFy+KHxA+LHxE/Kn5M/Lj4CfGT4qfET4ufET8rfk78vPgF8Yvil8Qvi18Rvyp+Tfy6+A3xivhN8Vvit8XviN8VvyfeJt4ufl/8gfhD8Ufij8WfiD8Vfyb+XPyF+EvxV+Kvxd+IvxV/J/5e/IP4R/FP4p/Fv4h/Fa+KfxP/Lv5D/Kf4L/Hf4h07MW03Wzjej+/j+fg9Xo/P4/H4O96Or+Pp+Dlejo/j4fg33o1v49n4NV6NT+PRuXLOlzO+XCxn/Bgvxofx4HI54734Lp6L3+K1+Cwei7/irfgqnoqf4qX4KB6Kf+Kd+CaeiV/ilfgkHlkpZ7wRX8QT8UO8EB/EA3mm+9P76fz0fbo+PZ+OT7+n29Pr6fT0ebo8PZ4OT3+nu9Pb6ez0dbo6PZ2OnijnxnKmlzeVM32cLk4Pp4Mny5nuTe+mc9O36dr0bDo2/ZpuTa+mU9On6dL0aDo0/ZnuTG+mM9OX6cr0ZDpyppxbyple3FrO9GG6MD2YDtxezng/vo/n4/d4PT6Px+PveDu+jqfj53g5Po6H4994N76NZ+PXeDU+jUdXyxlvxpfxZPwYL8aH8eBa9f/HWDlnylnbvUd9bafXatSmm81ee6pXb9Tna1PdhU6r1mwtTHfqnXqr01qa6jQavU6z0+4udNu1br3Z6NX7rW6jX15slPeshnDPXp9Hpz3Ke44N7Z7dxVHec4/hvZ/9Ud5zfHjv59Qo77lhePdsjPKeew7tnvMj/b7vNbzP50i/R3sP755L3G1Dea1l3Znv63j5Pf9D3h/+dtqILqKJ6CFaiA6igegf2ofuoXnoHVqHzqFx6Bvahq6haegZWoaOoWEmqkG70C00C71Cq9ApNMpkNWgTuoQmoUdoETqEBuFDgrz58vHBpjdoDToDEdMXtAVdQVPQE7QEHbG5vLe0A91AM9ALtAKdQCPQB7QBXUAT0AO0AB1AAzD/mf3MfWY+855Zz5xnxjPfme3MdWY685xZzhxnhq9Wg9nN3GZmM6+Z1czpHdV///vZarCjsJ+wm7CXsJOwj7CLsIewg7B/sHuwd7BzsG+wa7BnsGOwX7BbsFewU7BPsEvMVYMdgv2BDzR7AzsD8mVX4PPCjsB+wG7AXsBOwD7ALsAewA5A/9P+dD/NT+/T+nQ+jU/f0/Z0PU1Pz9PyK9Wg4el32p1up9np9W3VLh7/AgbniOPdFwAA\"}";
    }
}
