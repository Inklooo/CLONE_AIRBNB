require "open-uri"
User.destroy_all

user1 = User.create(email: "damien@gmail.com", password: "123456")
file = URI.open("https://i.pinimg.com/originals/c3/78/03/c37803cb28336822e75380551210e10a.jpg")
user1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
cottage1 = Cottage.new(name: "Brand new cottage in Montérégie", address: "5483 Rang de Fort-Georges, Sainte-Angèle-de-Monnoir, QC J0L 1P0, Canada", description: "Beautiful brand new cottage in Montérégie with 7 rooms", price: "199", availability: true)
cottage1.user = user1
file = URI.open("https://imgs.search.brave.com/devytdvNuTTG7ifDM8xGvUPO8bMPyPqogyiWb9Q2ubg/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9zdC5k/ZXBvc2l0cGhvdG9z/LmNvbS8yODYzMDQ5/LzM4NzYvaS80NTAv/ZGVwb3NpdHBob3Rv/c18zODc2NDkzMS1z/dG9jay1waG90by13/aW50ZXItc2tpLWNo/YWxldC1hbmQtY2Fi/aW4uanBn")
cottage1.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
cottage1.save
cottage2 = Cottage.new(name: "Beautiful cottage in Mont-Tremblant", address: "615 Rue Brown, Mont-Tremblant, QC J8E 2T1, Canada", description: "Skiing or trekking is near, amazing 5 bedrooms cottage", price: "428", availability: true)
cottage2.user = user1
file = URI.open("https://imgs.search.brave.com/ef3ijeuRU_CPShI_eP26p-wHaKGFldKuPcjK1LPES4A/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cGhvdG9zLXByZW1p/dW0vY2FiYW5lLWhp/dmVyLWNvbmZvcnRh/YmxlLWRhbnMtYm9p/c18xOTgwNjctMTIx/NjkuanBnP3NpemU9/NjI2JmV4dD1qcGc")
cottage2.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
cottage2.save
cottage3 = Cottage.new(name: "Luxury cottage in Mont-Orford", address: "5 Rue des Floralies, Austin, QC J0B 1B0, Canada", description: "Visit our beautiful 8 rooms cottages in the amazing mountains of Québec", price: "1200", availability: true)
cottage3.user = user1
file = URI.open("https://parcs.canada.ca/voyage-travel/hebergement-accommodation/chalet-cabin//pcweb2.azureedge.net/-/media/WET4/voyage-travel/hebergement-accommodation/chalet-cabin/03CabinGallery06-ONGBI201401800.jpg?modified=20190523133517")
cottage3.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
cottage3.save

user2 = User.create(email: "cariboudelest@gmail.com", password: "123456")
file = URI.open("https://tse1.mm.bing.net/th?id=OIP.HRxIKAx41QLKBpy_saQ3DQHaLH&pid=Api&P=0&h=180")
user2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
cottage4 = Cottage.new(name: "Chalet en forêt | Sauna & foyer", address: "17 Chemin Bob, Austin, QC J0B 1B0, Canada", description: "Situé dans une foret au sein même du village de Austin (Cantons-de-l'Est) à 1h30 de Montréal, Chalet Crème est un chalet au design épuré, avec une jolie vue sur la nature environnante grâce à ses nombreuses fenêtres XL.", price: "260", availability: true)
cottage4.user = user2
file = URI.open("https://imgs.search.brave.com/6DE0XDgmVRFI_vO3l6G7-kOxBsrA9Me2WpKey4xx2zY/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cGhvdG9zLXByZW1p/dW0vcGhvdG9ncmFw/aGllLWR1LWNoYWxl/dC1wYXlzYWdlXzU5/OTg2Mi0yMjAwNC5q/cGc_c2l6ZT02MjYm/ZXh0PWpwZw")
cottage4.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
cottage4.save
cottage5 = Cottage.new(name: "Tiny house - Lac-Beauport", address: "24 Chemin du Domaine, Beaumont, QC G0R 1C0", description: "Un endroit de rêve unique à 20 min de la ville de Québec. Le Hygge fait partie du projet Le Maelström et est situé sur la montagne du Mont-Tourbillon dans la municipalité de Lac-Beauport. C’est l’endroit idéal pour se changer les idées, se ressourcer la fin de semaine.", price: "559", availability: true)
cottage5.user = user2
file = URI.open("https://imgs.search.brave.com/lPVSkHf_nQZRfquopd08twEv1B04jayTYyGwpfvNtJc/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cGhvdG9zLXByZW1p/dW0vcGhvdG8tY2Fi/YW5lLW1vbnRhZ25l/Xzc3ODc4MC00ODA4/OS5qcGc_c2l6ZT02/MjYmZXh0PWpwZw")
cottage5.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
cottage5.save
