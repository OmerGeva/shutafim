# Users
omer = User.create(
  email: 'omer@geva.com',
  password: '123456',
  first_name: 'Omer',
  last_name: 'Geva',
  username: 'omergeva'
  )
omer.remote_photo_url = 'https://avatars2.githubusercontent.com/u/54701359?v=4'
omer.save

brad = User.create(
  email: 'brad@korman.com',
  password: '123456',
  first_name: 'Brad',
  last_name: 'Korman',
  username: 'bradkorman'
  )
brad.remote_photo_url = 'https://avatars2.githubusercontent.com/u/54051432?v=4'
brad.save

alisa = User.create(
  email: 'alisa@silina.com',
  password: '123456',
  first_name: 'Alisa',
  last_name: 'Silina',
  username: 'alisasilina'
  )
alisa.remote_photo_url = 'https://avatars0.githubusercontent.com/u/54353429?v=4'
alisa.save
