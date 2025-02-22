fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 From a given list of integers, generate a list of rolling maximum element found until given moment
    in the sequence.
    
*/
fn rolling_max(numbers:Vec<i32>) -> Vec<i32>{

    let mut running_max :Option<i32> = None;
    let mut result:Vec<i32> = vec![];

    for n in numbers{
        if running_max == None {
            running_max = Some(n);

        }else{
            running_max = max(running_max, Some(n));
        }

        result.push(running_max.unwrap());
    }
    return result;

}
