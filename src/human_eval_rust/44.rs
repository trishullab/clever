fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Change numerical base of input number x to base.
    return string representation after the conversion.
    base numbers are less than 10.
    
*/
fn change_base(x:i32, base:i32) -> String{


    let mut ret:String = "".to_string();
    let mut x1 = x;

    while  x1 > 0{
        ret = (x1 % base).to_string() + &ret;
        x1 = x1 / base;
    }
    return ret;
}
