class Hour < ActiveHash::Base
  self.data = [
    { id: 1, name: '00:00' }, { id: 2, name: '00:30' },
    { id: 3, name: '01:00' }, { id: 4, name: '01:30' },
    { id: 5, name: '02:00' }, { id: 6, name: '02:30' },
    { id: 7, name: '03:00' }, { id: 8, name: '03:30' },
    { id: 9, name: '04:00' }, { id: 10, name: '04:30' },
    { id: 11, name: '05:00' }, { id: 12, name: '05:30' },
    { id: 13, name: '06:00' }, { id: 14, name: '06:30' },
    { id: 15, name: '07:00' }, { id: 16, name: '07:30' },
    { id: 17, name: '08:00' }, { id: 18, name: '08:30' },
    { id: 19, name: '09:00' }, { id: 20, name: '09:30' },
    { id: 21, name: '10:00' }, { id: 22, name: '10:30' },
    { id: 23, name: '11:00' }, { id: 24, name: '11:30' },
    { id: 25, name: '12:00' }, { id: 26, name: '12:30' },
    { id: 27, name: '13:00' }, { id: 28, name: '13:30' },
    { id: 29, name: '14:00' }, { id: 30, name: '14:30' },
    { id: 31, name: '15:00' }, { id: 32, name: '15:30' },
    { id: 33, name: '16:00' }, { id: 34, name: '16:30' },
    { id: 35, name: '17:00' }, { id: 36, name: '17:30' },
    { id: 37, name: '18:00' }, { id: 38, name: '18:30' },
    { id: 39, name: '19:00' }, { id: 40, name: '19:30' },
    { id: 41, name: '20:00' }, { id: 42, name: '20:30' },
    { id: 43, name: '21:00' }, { id: 44, name: '21:30' },
    { id: 45, name: '22:00' }, { id: 46, name: '22:30' },
    { id: 47, name: '23:00' }, { id: 48, name: '23:30' }
  ]

  include ActiveHash::Associations
  has_many :store_informations
end
