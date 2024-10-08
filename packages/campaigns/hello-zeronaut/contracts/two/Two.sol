// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import "hardhat/console.sol";

import {UltraVerifier} from "./Verifier.sol";
import {ILevel} from "zeronaut-contracts/contracts/interfaces/ILevel.sol";
import {Zeronaut} from "zeronaut-contracts/contracts/Zeronaut.sol";

contract Two is ILevel, UltraVerifier {
    function instructions() public pure returns (string memory) {
        return "Can you find the prime factors of 1337?";
    }

    function check(bytes calldata proof, bytes32[] calldata publicInputs) public view returns (bool) {
        return this.verify(proof, publicInputs);
    }

    function circuit() public pure returns (string memory) {
        return "{\"abi\":{\"parameters\":[{\"name\":\"signature\",\"type\":{\"kind\":\"array\",\"length\":64,\"type\":{\"kind\":\"integer\",\"sign\":\"unsigned\",\"width\":8}},\"visibility\":\"private\"},{\"name\":\"pubKeyX\",\"type\":{\"kind\":\"array\",\"length\":32,\"type\":{\"kind\":\"integer\",\"sign\":\"unsigned\",\"width\":8}},\"visibility\":\"public\"},{\"name\":\"pubKeyY\",\"type\":{\"kind\":\"array\",\"length\":32,\"type\":{\"kind\":\"integer\",\"sign\":\"unsigned\",\"width\":8}},\"visibility\":\"public\"},{\"name\":\"hashedMsg\",\"type\":{\"kind\":\"array\",\"length\":32,\"type\":{\"kind\":\"integer\",\"sign\":\"unsigned\",\"width\":8}},\"visibility\":\"private\"},{\"name\":\"factor_1\",\"type\":{\"kind\":\"integer\",\"sign\":\"unsigned\",\"width\":32},\"visibility\":\"private\"},{\"name\":\"factor_2\",\"type\":{\"kind\":\"integer\",\"sign\":\"unsigned\",\"width\":32},\"visibility\":\"private\"}],\"return_type\":null,\"error_types\":{}},\"bytecode\":\"H4sIAAAAAAAA/9WY53MbZRyET5HthBpMCR0UQjFd1ZaoDoHg0Hsvlmw5NsQy2HLoxPTQe29OcbA/MPAXMni5d8n5Sfjk0wy+Gc1Pz1h+9epO2tvdTBQfS8uPP8PzzPIjG55vSHAGvA6cBXeBu8E94PXgDeBjwMeCjwMfDz4BfCJ4I/gkcC/4ZPAp4FPBp4E3gU8HnwE+E3wW+GzwOeBzweeBzwfnwJvBF4C3gC8EXwS+GHwJuA98Kfgy8OXgK8BXgq8CXw3OgwvgIrgELoMr4H7wALgKroGvAV8Lvg58PfgG8I3gQfBW8E3gbeCbwbeAt4NvBQ+Bd4BvA98OvgN8J/gu8N3ge8D3gu8D3w9+APwg+CHww+BHwI+CHwM/Dn4C/CT4KfDT4GFwHdwAj4BHwU3wGHgneBw8AX4G/Cx4F3gS3AJPgZ8DPw+eBs+A2+BZ8G7wC+AXwS+BXwa/An4V/Br4dfAe8Bz4DfCb4LfAb4PfAb8Lfg+8F/w++APwh+CPwB+DPwF/Cv4M/Dn4C/CX4K/AX4O/AX8L/g78PfgH8I/gn8A/g38B/wqej2IPYN6XYHmvwfD6rWH6frAtTOu/dd96b50fCtO6bj23jlu/rdvWa+u09dm6bD22Dlt/rbvWW+us9dW6aj21jlo/rZvWS+vkcJj1MK2HI2Fa/6x71jvr3HiY1jXrmXXM+mXdsl5Zp6xP1iXrkXXI+mPdsd5YZ6wv1hXriXXE+mHdsF5YJ6Lo8PdF03kgG6b9v32//b59vh/29fbz9vH27/bt9uv26fbn9uX24/bh9t/23fbb9tn21/bV9tP20fbP9s32y/bJuTA3h2k/vCVM+1/7Xvtd+9y+MO1r7WftY+1f7VvtV+1T7U/tS+1H7UPtP+077TftM+0v7SvtJ+0j7R/tG+0X7RPnwvR9wfcD3wes/9Z96711fm+Y1nXruXXc+m3dtl5bp63P1mXrsXXY+mvdtd5aZ62v1lXrqXXU+mndtF5aJ/dHK49MmINh5ld3FPYn1irl+8vl5kCxWSgV6vlirVGt5MuVRn+1UC1UqpXRYrVUalbL1YFaozaQrxXKpWZhrFIrjYXFkvtch32udu35FNc6kOL568Z16eS1SnHf+eR+Dx5t/2ltulMn4mAH1l2I0v0xdOJzL6R/jfKd/NIudGifaQvMvhTXOhStTYFJcd8rBOa3aI0JzCFsOq11F6P/t8Docy+mf406KjCLKe8z7f3NR3Gq5bqrvf5La+T6LKXwmZtjy0d9pKq9dYW1GtizbgjZ8HeJppKgU6DSn5KfUp8Sn9Kekp5SnhKe0p2SnVKdEp3SnJKcUpwSnNKbkptSmxKb0pqSmlJaLorTmZKZUpkSmdKYkphSWF8Upy8lL6UuJS6lLSUtpSydfImYkpVSlRKV0pSSlFKUEpTSk5KTUpMSk9KSkpJS0lwUpyMlI6UiJSKlISUhpSAlIKUfJR+lHiUepR0lHaUcJRylGyUbpRolGqUZJRmlGCUYpRclF6UWJRalFSUVpZT5KP5+D4Zroam2Rk2NWho1NGpn1MyolRmK4jZGTYxaGDUwal/UvKh1UeOitkVNi1oWNSxqV9SsqFVRo6I2RU2KWhQ1KGpP1JyoNRmO4rZE3w+1JGpI1I6oGVErMh7FbYiaELUgakDUfqj5UOuhxkNth5oOtRxqONRuqNlQq6FGQ22Gmgy1GGow1F6oudgTHT66Es8PJJ73hrmjtbu+a2I0NzOxs1Vvz05rjyvEd1OY2+sj7anpXCE3OTvTzrWm2rlGM/fPbe/3/3518chX/5F49UZsojU72WhOz/z7418fZk/if3gHdx2j468oXTHKhrW6E+/n9+pK/L0nsZdM+nspJD9vNjryHPQe5fz8DQfhPEzvHgAA\"}";
    }
}
