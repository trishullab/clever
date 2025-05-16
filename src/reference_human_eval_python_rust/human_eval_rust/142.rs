fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
"
    This function will take a list of integers. For all entries in the list, the function shall square the integer entry if its index is a 
    multiple of 3 and will cube the integer entry if its index is a multiple of 4 and not a multiple of 3. The function will not 
    change the entries in the list whose indexes are not a multiple of 3 or 4. The function shall then return the sum of all entries. 
    
*/
fn sum_squares_142(lst: Vec<i32>) -> i32 {


    let mut sum = 0;
    for i in 0..lst.len() {
        if i % 3 == 0 {
            sum += lst[i] * lst[i];
        } else if i % 4 == 0 {
            sum += lst[i] * lst[i] * lst[i];
        } else {
            sum += lst[i];
        }
    }
    return sum;
}
