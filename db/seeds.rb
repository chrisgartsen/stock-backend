
Item.delete_all

Item.create(name: 'Item 1', quantity: 0, minimum_quantity: 2)
Item.create(name: 'Item 2', quantity: 1, minimum_quantity: 3)
Item.create(name: 'Item 3', quantity: 3, minimum_quantity: 2)
Item.create(name: 'Item 4', quantity: 2, minimum_quantity: 2)
Item.create(name: 'Item 5', quantity: 1, minimum_quantity: 9)
Item.create(name: 'Item 6', quantity: 0, minimum_quantity: 0)
Item.create(name: 'Item 7', quantity: 3, minimum_quantity: 3)

p "Created #{Item.count} Items"


User.delete_all

User.create(name: 'Admin', email: 'admin@email.com', admin: true, active: true, password: 'admin')
User.create(name: 'Guest', email: 'guest@email.com', password: 'guest')
User.create(name: 'Chris', email: 'chris@email.com', password: 'chrisr')

p "Created #{User.count} Users"