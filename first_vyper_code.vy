# pragma version ^0.4.0
# @license MIT

struct Person:
    fav_num: uint256
    name: String[100]

my_name: public(String[100])
my_fav_num: public(uint256) # 88
list_of_nums: public(uint256[5]) # [0, 0, 0 ...]
list_of_people: public(Person[5])
index: public(uint256)

name_to_fav_number: public(HashMap[String[100], uint256])

@deploy
def __init__():
    self.my_fav_num = 88
    self.index = 0

@external
def store(new_num: uint256):
    self.my_fav_num = new_num

@external 
def add(my_fav_num: uint256):
    self.my_fav_num = my_fav_num + 1

@external
@view
def retrieve() -> uint256:
    return self.my_fav_num

@external
def add_person(name:String[100], fav_num: uint256):
    self.list_of_nums[self.index] = fav_num

    new_person: Person = Person(fav_num = fav_num, name = name)
    self.list_of_people[self.index] = new_person

    self.name_to_fav_number[name] = fav_num

    self.index = self.index + 1