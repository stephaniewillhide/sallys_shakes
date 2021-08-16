unless User.exists?(email: "sally@example.com")
  User.create!(name: "Sally", email: "sally@example.com", password: "password")
end
