fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Return only positive numbers in the list.
    
*/
fn get_positive(numbers:Vec<i32>) -> Vec<i32>{


    return numbers.into_iter().filter(|n| n.is_positive()).collect();

}
