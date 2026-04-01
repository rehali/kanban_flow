# db/seeds.rb
alice = User.create!(name: "Alice", email: "alice@example.com")
bob   = User.create!(name: "Bob",   email: "bob@example.com")

board = Board.create!(name: "KanbanFlow Development", user: alice)

Membership.create!(user: alice, board: board, role: :admin)
Membership.create!(user: bob,   board: board, role: :member)

todo  = board.columns.create!(name: "To Do",        position: 0)
doing = board.columns.create!(name: "In Progress",  position: 1)
done  = board.columns.create!(name: "Done",         position: 2)

todo.cards.create!(title: "Set up Rails app",     position: 0)
todo.cards.create!(title: "Install Phlex",        position: 1)
todo.cards.create!(title: "Build component library", position: 2)

doing.cards.create!(title: "Build AppLayout",     position: 0)

done.cards.create!(title: "Create Rails app",     position: 0)
