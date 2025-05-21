fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
We have an array 'arr' of N integers arr[1], arr[2], ..., arr[N].The
    numbers in the array will be randomly ordered. Your task is to determine if
    it is possible to get an array sorted in non-decreasing order by performing 
    the following operation on the given array:
        You are allowed to perform right shift operation any number of times.
    
    One right shift operation means shifting all elements of the array by one
    position in the right direction. The last element of the array will be moved to
    the starting position in the array i.e. 0th index. 

    If it is possible to obtain the sorted array by performing the above operation
    then return True else return False.
    If the given array is empty then return True.

    Note: The given list is guaranteed to have unique elements.
    
*/
fn move_one_ball(arr:Vec<i32>) -> bool{


    let mut num = 0;
    if arr.len() == 0 {
        return true;
    }
    for i in 1..arr.len() {
        if arr[i] < arr[i - 1] {
            num += 1;
        }
    }
    if arr[arr.len() - 1] > arr[0] {
        num += 1;
    }
    if num < 2 {
        return true;
    }
    return false;
}
