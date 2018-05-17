pragma solidity ^0.4.23;


contract Power {
    function traditionalPower(uint _number) public pure returns (uint){
        if(_number == 0){
            return 0;
        }
        uint result = 1;
        for(uint i = 1; i <= _number; i++){
            result = result * i;
        }
        return result;
    }
    
    function assemblyPowerWithSwitch(uint _number) public returns (uint _res){
        assembly {
            switch _number
            case 0 {
                _res := 0
            }
            default {
                let i := 1
                _res := 1
                loop:
                _res := mul(_res, i)
                i := add(i, 1)
                jumpi(loop, lt(i, add(_number, 1)))
            }
        }
    }
    
        function assemblyPowerWithIf(uint _number) public returns (uint res){
        assembly {
            if eq(_number, 0){
                res := 0
            }
            
            if gt(_number, 0) {
                let i := 1
                res := 1
                loop:
                res := mul(res, i)
                i := add(i, 1)
                jumpi(loop, lt(i, add(_number, 1)))
            }
        }
    }
}