
PKCoreData
=========

## Add user details in coredata
------------
 Added Some screens here.
 
[![](https://github.com/pawankv89/PKCoreData/blob/master/images/screen_1.png)]
[![](https://github.com/pawankv89/PKCoreData/blob/master/images/screen_2.png)]
[![](https://github.com/pawankv89/PKCoreData/blob/master/images/screen_3.png)]
[![](https://github.com/pawankv89/PKCoreData/blob/master/images/screen_4.png)]


## Usage
------------
 You can add this method in your `UICollectionView`.


```objective-c
//MARK: Add Person Record List
    @IBAction func adduttonAction(_ sender: Any) {
        
        if name.text! == "" || age.text! == "" || phone.text! == "" {
            return
        }
        
        let person = Person()
        
        person.name = name.text!
        person.age = age.text!
        person.phone = phone.text!
        person.gender = "Male"
        person.location = "Noida"
        person.accountType = "IOS"
        
        CoreDataStack.shared.insertPersonRecord(person: person)
        
        self.navigationController?.popViewController(animated: true)
    }
```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each MBProgressHUD release can be found in the [CHANGELOG](CHANGELOG.mdown). 
