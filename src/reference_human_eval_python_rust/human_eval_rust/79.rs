fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
You will be given a number in decimal form and your task is to convert it to
    binary format. The function should return a string, with each character representing a binary
    number. Each character in the string will be '0' or '1'.

    There will be an extra couple of characters 'db' at the beginning and at the end of the string.
    The extra characters are there to help with the format.
    
*/
fn decimal_to_binary(decimal:i32) -> String{


    let mut d_cp = decimal;
    let mut out: String = String::from("");
    if d_cp == 0 {
        return "db0db".to_string();
    }
    while d_cp > 0 {
        out = (d_cp % 2).to_string() + &out;
        d_cp = d_cp / 2;
    }
    out = "db".to_string() + &out + &"db".to_string();
    return out;
}
