fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    "Given an array representing a branch of a tree that has non-negative integer nodes
    your task is to pluck one of the nodes and return it.
    The plucked node should be the node with the smallest even value.
    If multiple nodes with the same smallest even value are found return the node that has smallest index.

    The plucked node should be returned in a list, [ smalest_value, its index ],
    If there are no even values or the given array is empty, return [].

    Constraints:
        * 1 <= nodes.length <= 10000
        * 0 <= node.value
    
*/
fn pluck(arr:Vec<i32>) -> Vec<i32> {


    let mut out:Vec<i32> = vec![];

    for i in 0.. arr.len(){
        if arr[i]%2 == 0 && (out.len() == 0 || arr[i]<out[0]){
        out = vec![arr[i], i as i32];
        }
       
    }
    return out;
}
