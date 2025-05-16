fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Given an array of integers, sort the integers that are between 1 and 9 inclusive,
    reverse the resulting array, and then replace each digit by its corresponding name from
    "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine".
    
*/
fn by_length(arr:Vec<i32>) -> Vec<String>{


    let mut res: Vec<String> = vec![];
    let mut arr_cp: Vec<i32> = arr.clone();
    arr_cp.sort();
    arr_cp.reverse();
    let map: HashMap<i32, &str> = HashMap::from([
        (0, "Zero"),
        (1, "One"),
        (2, "Two"),
        (3, "Three"),
        (4, "Four"),
        (5, "Five"),
        (6, "Six"),
        (7, "Seven"),
        (8, "Eight"),
        (9, "Nine"),
    ]);

    for elem in arr_cp {
        if elem >= 1 && elem <= 9 {
            res.push(map.get(&elem).unwrap().to_string());
        }
    }

    return res;
}
