# db/seeds.rb
alice = User.create!(name: "Alice Smith",  email: "alice@example.com", password: "password")
bob   = User.create!(name: "Bob Walker",   email: "bob@example.com",   password: "password")
carol = User.create!(name: "Carol Harris", email: "carol@example.com", password: "password")

# Board.create! triggers add_owner_as_member — Alice gets admin
# membership automatically. Do not add it again manually.
board = Board.create!(name: "KanbanFlow Development", user: alice)

# Add Bob and Carol as members
Membership.create!(user: bob,   board: board, role: :member)
Membership.create!(user: carol, board: board, role: :member)

todo  = board.columns.create!(name: "To Do",       position: 0)
doing = board.columns.create!(name: "In Progress", position: 1)
done  = board.columns.create!(name: "Done",        position: 2)

todo.cards.create!(title: "Set up Rails app",        position: 0)
todo.cards.create!(title: "Install Phlex",           position: 1)
todo.cards.create!(title: "Build component library", position: 2)

doing.cards.create!(title: "Build AppLayout", position: 0)
done.cards.create!(title: "Create Rails app", position: 0)