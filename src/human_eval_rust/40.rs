fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    triples_sum_to_zero takes a list of integers as an input.
    it returns True if there are three distinct elements in the list that
    sum to zero, and False otherwise.
    
*/
fn triples_sum_to_zero(nmbs:Vec<i32>) -> bool{


    for i in 0.. nmbs.len(){
        for j in i + 1.. nmbs.len(){
            for k in j + 1.. nmbs.len(){
                if *nmbs.get(i).unwrap() + *nmbs.get(j).unwrap() + *nmbs.get(k).unwrap() == 0{
                    return true;
                }
            }
        }
    }
return false;

}
