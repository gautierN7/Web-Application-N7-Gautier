# En utilisant le symbole ':user', nous faisons que
# Factory Girl simule un modèle User.
Factory.define :user do |u|
  u.sequence(:email) { "aol@aol.com" }
  u.id "17"
  u.password "Azerty"
end
