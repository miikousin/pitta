class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '0' },
    { id: 3, name: '1' },
    { id: 4, name: '2' },
    { id: 5, name: '3' },
    { id: 6, name: '4' },
    { id: 7, name: '5' }
  ]

  include ActiveHash::Associations
  has_many :users
end
