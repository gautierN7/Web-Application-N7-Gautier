# En utilisant le symbole ':user', nous faisons que
# Factory Girl simule un modèle User.
Factory.define :user do |u|
  u.sequence(:email) { |n| "user#{n}@example.com" }
  u.password "123456"
end
