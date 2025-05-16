fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
You are given two intervals,
    where each interval is a pair of integers. For example, interval = (start, end) = (1, 2).
    The given intervals are closed which means that the interval (start, end)
    includes both start and end.
    For each given interval, it is assumed that its start is less or equal its end.
    Your task is to determine whether the length of intersection of these two 
    intervals is a prime number.
    Example, the intersection of the intervals (1, 3), (2, 4) is (2, 3)
    which its length is 1, which not a prime number.
    If the length of the intersection is a prime number, return "YES",
    otherwise, return "NO".
    If the two intervals don't intersect, return "NO".
    
*/
fn intersection(interval1: Vec<i32>, interval2: Vec<i32>) -> String {


    let inter1 = std::cmp::max(interval1[0], interval2[0]);
    let inter2 = std::cmp::min(interval1[1], interval2[1]);
    let l = inter2 - inter1;
    if l < 2 {
        return "NO".to_string();
    }
    for i in 2..l {
        if l % i == 0 {
            return "NO".to_string();
        }
    }
    return "YES".to_string();
}
