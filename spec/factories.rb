# En utilisant le symbole ':user', nous faisons que
# Factory Girl simule un modèle User.
Factory.define :user do |u|
  u.sequence(:email) { "boby@aol.com" }
  u.password "Azerty"
end
