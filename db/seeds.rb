User.create!(email: "admin@admin.com", password: "adminpass", is_admin: true)

#Create Pages
page = Page.create!(name: "home")
page.sections.create!(name: "Home", title: "Texto 1", body: "text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text texto", has_title: true)
page.sections.create!(name: "Home", title: "Texto 2", body: "text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text texto", has_title: true)
page.sections.create!(name: "Home", title: "Texto 3", body: "text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text texto", has_title: true)


page = Page.create!(name: "about_us")
page.sections.create!(name: "About", title: "title", body: "body", has_image: true)

page = Page.create!(name: "promotions")
page.create_gallery!

Page.create!(name: "events")
Page.create!(name: "contact_us")

#Create Pages & Sections
page = Page.create!(name: "technology")
section = page.sections.create!(name: "Description", title: "Tecnología Digital", body: "body")
section.create_category(name: "Tecnología Digital")

page = Page.create!(name: "milling")
section = page.sections.create!(name: "Description", title: "Tratamientos", body: "body")
section.create_category(name: "Tallado Convencional")

page = Page.create!(name: "treatments")
section = page.sections.create!(name: "Description", title: "Tallado Convencional", body: "body")
section.create_category(name: "Tratamientos")

page = Page.create!(name: "futurex")
section = page.sections.create!(name: "Description", title: "FutureX", body: "body")
section.create_category(name: "Lentes Future X")

page = Page.create!(name: "materials")
section = page.sections.create!(name: "Description", title: "Materiales", body: "body")
section.create_category(name: "Materiales")

page = Page.create!(name: "type_of_glasses")
section = page.sections.create!(name: "Description", title: "Tipos de Lentes", body: "body")
section.create_category(name: "Tipos de Lentes")

#Create Categories


#Create Main Contact
Contact.create!(main: true, address1: "Jr. Manuel Irribarren 1325 Surquillo - Lima Perú", email1: "servicioalcliente@ocutec.com.pe", phone1: "618-5555", week_available: "9am a 6pm", saturday_available: "9am a 1pm", sunday_available: "No hay atención")

#Create Contacts
Contact.create!(name: "Karol Sanchez Figueroa", position: "Representante de Ventas", description: "", email1: "ksanchez@ocutec.com.pe ", email2: "", phone1: "99-816-6581", phone2: "816*6581 (Nextel)", phone3: "", state: "lima")
Contact.create!(name: "Alvaro Jacobo", position: "Representante de Ventas", description: "", email1: "ajacobo@ocutec.com.pe", email2: "", phone1: "99-835-0992", phone2: "835*0992 (Nextel)", phone3: "", state: "lima")
Contact.create!(name: "Guisell Pinto Muratta", position: "Consultora Transitions", description: "", email1: "gpinto@ocutec.com.pe", email2: "", phone1: "99-103-4517", phone2: "103*4517 (Nextel)", phone3: "", state: "lima")
Contact.create!(name: "Rocio Robles Saldarriaga", position: "Consultora FutureX", description: "", email1: "rrobles@ocutec.com.pe", email2: "", phone1: "618-5555", phone2: "618-5566 (Fax)", phone3: "812*7792 | 812*7323 (Nextel)", state: "lima")
Contact.create!(name: "Carmen Nagahama Yara", position: "Jefe Servicio al Cliente", description: "Oficina Surquillo", email1: "servicioalcliente@ocutec.com.pe", email2: "", phone1: "428-4598", phone2: "822*6180  (Nextel)", phone3: "", state: "lima")
Contact.create!(name: "Susana Tokuda Kina", position: "Servicio al Cliente", description: "", email1: "stokuda@ocutec.com.pe", email2: "", phone1: "428-4598", phone2: "822*6180  (Nextel)", phone3: "", state: "lima")
Contact.create!(name: "Oficina Trujillo", position: "", description: "", email1: "ventastrujillo@ocutec.com.pe", email2: "", phone1: "4-420-8907", phone2: "", phone3: "", state: "trujillo")
Contact.create!(name: "Susana Luna Victoria", position: "Representante de Ventas", description: "", email1: "", email2: "", phone1: "99-423-3405", phone2: "423*3405 (Nextel)", phone3: "", state: "trujillo")
Contact.create!(name: "Oficina Arequipa", position: "", description: "", email1: "ventasarequipa@ocutec.com.pe", email2: "", phone1: "5-420-3880", phone2: "", phone3: "", state: "arequipa")
Contact.create!(name: "Cesar Oviedo Carazas", position: "Representante de Ventas", description: "", email1: "", email2: "", phone1: "99-405-7861", phone2: "405*7861 (Nextel)", phone3: "", state: "arequipa")