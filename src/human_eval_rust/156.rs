fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Given a positive integer, obtain its roman numeral equivalent as a string,
    and return it in lowercase.
    Restrictions: 1 <= num <= 1000
    
*/
fn int_to_mini_romank(number: i32) -> String {


    let mut current = String::new();
    let mut number = number;
    let rep = vec![
        "m", "cm", "d", "cd", "c", "xc", "l", "xl", "x", "ix", "v", "iv", "i",
    ];
    let num = vec![1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    let mut pos = 0;
    while number > 0 {
        while number >= num[pos] {
            current.push_str(rep[pos]);
            number -= num[pos];
        }
        if number > 0 {
            pos += 1;
        }
    }
    current
}
