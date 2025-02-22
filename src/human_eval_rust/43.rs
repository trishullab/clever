fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    pairs_sum_to_zero takes a list of integers as an input.
    it returns True if there are two distinct elements in the list that
    sum to zero, and False otherwise.
    
*/
fn pairs_sum_to_zero(l:Vec<i32>) -> bool{


    for (i, l1) in l.iter().enumerate(){
        for j in i + 1.. l.len(){
            if l1 + l[j] == 0{
                return true;
            }
        }
    }

    return false;
}
