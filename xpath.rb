require 'Nokogiri'
require 'mechanize'
require_relative 'magic_town'

magic_towns = 'Real de Asie​​ntos​​, Calvillo​, San José ​​de Gracia, Tecate, Todos Santos, Loreto​, Palizada, San Cristobal de las Casas, Comitán de Domínguez​, Chiapa de Corzo, Pale​nque​, Creel, Batopilas, Casas Grandes, ​Parras de la Fuente, Cuatro Ciénegas, ​Arteaga, Viesca, Candela, Guerrero​​​​​, Comala, Mapimí, Dolores Hidalgo, Mineral del Pozo, Jalpa, ​Salvatierra, ​Yuriria​​​​, Taxco, Huasca de Ocampo, Real del Monte, Mineral el chico, Huichapan, ​Tecozautla​​​​, Tapalpa, Tequila, ​Mazamitla, ​San Sebastián del Oeste, Lagos de Moreno, Mascota, ​Talpa de Allende​​​​​​, ​Tepotzotlán, Valle de Bravo, Malinalco, El Oro, Metepec​, Aculco, Teotihuacán y San Martín de las Pirámides​, ​Ixtapan de la Sal, Villa del Carbón​​​​​​​​, ​Pátzcuaro, Tlalpujahua, Cuitzeo, Santa Clara del Cobre, Angangueo, Tacámbaro, ​Jiquilpan, ​Tzintzuntzan​​​​​​, Tepoztlan, Tlayacapan,  Jala, Sayulita​, ​Santiago, ​Linares, Capulálpam de Méndez, Huautla de Jiménez​, Mazunte, San Pablo​ ​​Villa de Mitla,​​ San Pedro y San Pablo​, ​Cuetzalan, Zacatlán de las Manzanas​, Pahuatlán, Chignahuapan, Cholula, Tlatlauquitepec, Xicotepec, ​Atlixco, Huauchinango​​​​​​​​, Bernal, Jalpan de Serra, Cadereyta, ​Tequisquiapan, San Joaquín​​​​​​, Bacalar, Isla Mujeres, Tulum​​, Real de Catorce, ​Xilitla, Cosalá, El Fuerte, El Rosarito, Mocorito​​​​, Álamos, Magdalena de Kino, Tapijulapa, Mier, Tula, Huamantla,​ ​Tlaxco, Xico, ​Coatepec, ​Papantla, Coscomatepec, Orizaba, Zozocolco​​​​​, ​Izamal, Valladolid​, ​Jerez de García Salinas, Teul González Ortega, Sombrerete, Pinos, Nochistlán​​​​​'

towns_with_li = {}
def string_to_arr(str)
  str.split(',').map(&:strip).delete_if(&:nil?)
end

towns_arr = string_to_arr(magic_towns)

agent = Mechanize.new

all_pages = []

page = agent.get('https://www.datatur.sectur.gob.mx/Pueblos Magicos/PueblosMagicosIni.aspx')
page.links.each do |link|
  all_pages << link.click if towns_arr.include?(link.text)
end

def get_magic_town(query, page)
  page.xpath(query).inner_text.gsub(/(\s{3,})(Inicio de sesión)(\s{3,})/, '')
end


all_pages.each_with_index do |_page, index|
  towns_with_li[index] = get_magic_town('//li[span or p]', all_pages[index])
end


puts towns_with_li
# states = 'Aguascalientes, Baja California, Baja California Sur, Campeche, Chiapas, Chihuahua, ​​​​Coahuila, Colima, Durango, Estado de México, Gua​najuato, Guerrero, ​​​Hidalgo, ​​​​​Jalisco,​ Michoacán, Mo​rel​os, Naya​rit,​ Nue​vo León,​ ​​​Oaxaca, ​​​​​​​​Puebla, Querétaro, Quintana Roo, San Lui​s Potosí, Sinaloa, Sonora, Tabasco,​ Tamaulipas, Tlaxcala, Veracruz, Yucatán, Zaca​tecas​​​​'


# states_hash = string_to_arr(states).map.with_index { |element, indx| [indx, element] }.to_h

# //tr/td/a -> gets all the town names
