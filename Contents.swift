//: Playground - noun: a place where people can play
//作业一
var zhishu:[Int] = []
var bool = true
for i in 2...100{
    bool = true
    for j in 2..<i{
        if i % j == 0{
            bool = false
            break;
        }
    }
    if bool == true{
        zhishu.append(i)
    }
}
print(zhishu)
//排序
var sort1 = {
    (scores:[Int]) ->[Int] in
    return scores.sorted{ $0>$1 }
}(zhishu)
print(sort1)
var sort2 = zhishu.sorted{ $0>$1 }
print(sort2)
var s3 = {
    return $0.sorted(by:{ $0 > $1})
}(zhishu)
print(s3)
var s4 = (zhishu.sorted(by:{(one,two) in one>two }))
print(s4)
var s5 = zhishu.sorted(by: > )
print(s5)
var s6 = zhishu.sorted(by: {
    (one:Int,two:Int) -> Bool in
    return one>two
})
print(s6)
//作业二
enum Gender{
    case male
    case female
    static func >(one:Gender,two:Gender) -> Bool{
        if one.hashValue > two.hashValue{
            return true
        }else{
            return false
        }
    }
}
class Person:CustomStringConvertible{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    init(firstName:String,lastName:String,age:Int,gender:Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:18,gender:Gender.female)
    }
    var fullName:String{
        get{
            return firstName+lastName
        }
    }
    var description: String{
        return "name:"+fullName+" age:\(age)"+" Gender:\(gender)"
    }
    static func ==(right:Person,left:Person) -> Bool {
        return(right.firstName==left.firstName&&right.lastName==left.lastName&&right.age==left.age&&right.gender==left.gender)
    }
    static func !=(right:Person,left:Person) -> Bool {
    return !(right.firstName==left.firstName&&right.lastName==left.lastName&&right.age==left.age&&right.gender==left.gender)
    }
}
let p1 = Person(firstName: "zhang", lastName: "xiaoxiao", age: 18, gender: Gender.female)
let p2 = Person(name: "zhangxiao")
let p3 = Person(name: "zhangxiao")
print(p1)
print(p2)
print(p1 == p2)
print(p2 != p3)
class Teacher:Person{
    var title:String
    init(title:String,firstName: String, lastName: String, age: Int, gender: Gender) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override var description: String{
        return "name:"+fullName+" age:\(age)"+" Gender:\(gender)"+" title:"+title
    }
    
}
class Student:Person{ 
    var stuNo:String
    init(stuNo:String,firstName: String, lastName: String, age: Int, gender: Gender) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override var description: String{
        return "name:"+fullName+" age:\(age)"+" Gender:\(gender)"+" stuNo:"+stuNo
    }
    
}
let t1 = Teacher(title: "t1", firstName: "li", lastName: "li", age: 20, gender: Gender.male)
print(t1)
let t2 = Teacher(title: "t2", firstName: "zhang", lastName: "dada", age: 30, gender: Gender.male)
print(t2)
let s1 = Student(stuNo: "001", firstName: "chen", lastName: "xiang", age: 40, gender: Gender.male)
let s2 = Student(stuNo: "002", firstName: "xi", lastName: "xiao", age: 25, gender: Gender.female)
print(s1)
print(s2)
var people = [Person]()
people.append(p1)
people.append(p2)
people.append(t1)
people.append(t2)
people.append(s1)
people.append(s2)
var nump = 0
var numt = 0
var nums = 0
for person in people{                 //统计每个类的对象装进字典
    if person is Teacher {
        numt+=1
    }else if person is Student {
        nums+=1
    }else{
        nump+=1
    }
}
var dictionary:[String:Int] = [:]
dictionary["people"] = nump
dictionary["teacher"] = numt
dictionary["student"] = nums
print(dictionary)
//print(s1 is Person)
let byAge = people.sorted(by: {(one:Person,two:Person) -> Bool in
    return one.age > two.age
} )
print(byAge)
let byfullName = people.sorted(by: {(one:Person,two:Person) -> Bool in
    return one.fullName > two.fullName
} )
print(byfullName)

let byGa = people.sorted(by: {(one:Person,two:Person) -> Bool in
    return one.gender > two.gender && one.age > two.age
} )
print(byGa)

