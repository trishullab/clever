fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
This function takes two positive numbers x and y and returns the
    biggest even integer number that is in the range [x, y] inclusive. If 
    there's no such number, then the function should return -1.
    
*/
fn choose_num(x:i32, y:i32) -> i32{


    if y < x {
        return -1;
    }
    if y == x && y % 2 == 1 {
        return -1;
    }
    if y % 2 == 1 {
        return y - 1;
    }
    return y;
}
