fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Given a list of positive integers x. return a sorted list of all 
    elements that hasn't any even digit.

    Note: Returned list should be sorted in increasing order.
    
*/
fn unique_digits(x:Vec<i32>) -> Vec<i32>{


    let mut res: Vec<i32> = vec![];
    for (_, elem) in x.into_iter().enumerate() {
        let mut elem_cp: i32 = elem;
        let mut u: bool = true;
        if elem == 0 {
            u = false;
        }
        while elem_cp > 0 && u {
            if elem_cp % 2 == 0 {
                u = false;
            }
            elem_cp = elem_cp / 10;
        }
        if u {
            res.push(elem)
        };
    }
    res.sort();
    return res;
}
