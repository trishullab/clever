fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Given list of integers, return list in strange order.
    Strange sorting, is when you start with the minimum value,
    then maximum of the remaining integers, then minimum and so on.
    
*/
fn strange_sort_list(lst: Vec<i32>) -> Vec<i32>{


    let mut cp:Vec<i32> = lst.clone();
    let mut res:Vec<i32> = vec![];

    for (indx, _) in lst.iter().enumerate(){
        if indx%2 == 1 {
            let max:i32 = *cp.iter().max().unwrap();
            res.push(max);
            cp.remove(cp.iter().position(|x| *x == max).unwrap());
        }
        else{
            let min:i32 = *cp.iter().min().unwrap();
            res.push(min);
            cp.remove(cp.iter().position(|x| *x == min).unwrap());
        }
    }
    return res;
}
