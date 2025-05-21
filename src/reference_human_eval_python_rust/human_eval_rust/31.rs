fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Return true if a given number is prime, and false otherwise.
    
*/
fn is_prime(n:i32) -> bool{


    if n < 2{
    return false;
}
for k in 2..n-1 {
    if n % k == 0{
        return false;
    }
}
return true;

}
