fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Given the lengths of the three sides of a triangle. Return the area of
    the triangle rounded to 2 decimal points if the three sides form a valid triangle. 
    Otherwise return -1
    Three sides make a valid triangle when the sum of any two sides is greater 
    than the third side.
    
*/
fn triangle_area_f64(a:f64, b:f64, c:f64) -> f64{


    if a+b<=c || a+c<=b || b+c<=a {return -1.0;}
    let h:f64=(a+b+c) / 2.0;
    let mut area:f64;
    area = f64::powf(h*(h-a)*(h-b)*(h-c),0.5);
    return area;
}
