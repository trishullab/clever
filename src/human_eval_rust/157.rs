fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Given the lengths of the three sides of a triangle. Return True if the three
    sides form a right-angled triangle, False otherwise.
    A right-angled triangle is a triangle in which one angle is right angle or 
    90 degree.
    
*/
fn right_angle_triangle(a: f32, b: f32, c: f32) -> bool {


    if (a * a + b * b - c * c).abs() < 1e-4
        || (a * a + c * c - b * b).abs() < 1e-4
        || (b * b + c * c - a * a).abs() < 1e-4
    {
        return true;
    }
    return false;
}
