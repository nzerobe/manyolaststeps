# README



# *My application will be developed with the following schema.*

## **Blog Table**

1. t.string :Title
2. t.text :Content
3. t.integer :user_id
4. t.integer :category_id


## **Users Table**

1. t.string :Name
2. t.string :Email
3. t.string :Encrypted_password
4. t.string :Password_digest


## **Categories Table**

1. t.string :Windows
2. t.string :Mac
3. t.string :Linux
4. t.string :Android
5. t.string :Iphone
6. t.string :Hardware
7. t.string :Software
8. t.text :Name
9. t.text :Content
10. t.integer :user_id
11. t.integer :blog_id


## **Label**

1. References :blog_id 
2. References :user_id 

