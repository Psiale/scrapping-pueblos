

states = "Aguascalientes, Baja California, Baja California Sur, Campeche, Chiapas, Chihuahua, ​​​​Coahuila, Colima, Durango, Estado de México, Gua​najuato, Guerrero, ​​​Hidalgo, ​​​​​Jalisco,​ Michoacán, Mo​rel​os, Naya​rit,​ Nue​vo León,​ ​​​Oaxaca, ​​​​​​​​Puebla, Querétaro, Quintana Roo, San Lui​s Potosí, Sinaloa, Sonora, Tabasco,​ Tamaulipas, Tlaxcala, Veracruz, Yucatán, Zaca​tecas​​​​"

magic_towns = "Real de Asie​​ntos​​, Calvillo​, San José ​​de Gracia, Tecate, Todos Santos, Loreto​, Palizada, San Cristobal de las Casas, Comitán de Domínguez​, Chiapa de Corzo, Pale​nque​, Creel, Batopilas, Casas Grandes, ​Parras de la Fuente, Cuatro Ciénegas, ​Arteaga, Viesca, Candela, Guerrero​​​​​, Comala, Mapimí, Dolores Hidalgo, Mineral del Pozo, Jalpa, ​Salvatierra, ​Yuriria​​​​, Taxco, Huasca de Ocampo, Real del Monte, Mineral el chico, Huichapan, ​Tecozautla​​​​, Tapalpa, Tequila, ​Mazamitla, ​San Sebastián del Oeste, Lagos de Moreno, Mascota, ​Talpa de Allende​​​​​​, ​Tepotzotlán, Valle de Bravo, Malinalco, El Oro, Metepec​, Aculco, Teotihuacán y San Martín de las Pirámides​, ​Ixtapan de la Sal, Villa del Carbón​​​​​​​​, ​Pátzcuaro, Tlalpujahua, Cuitzeo, Santa Clara del Cobre, Angangueo, Tacámbaro, ​Jiquilpan, ​Tzintzuntzan​​​​​​, Tepoztlan, Tlayacapan,  Jala, Sayulita​, ​Santiago, ​Linares, Capulálpam de Méndez, Huautla de Jiménez​, Mazunte, San Pablo​ ​​Villa de Mitla,​​ San Pedro y San Pablo​, ​Cuetzalan, Zacatlán de las Manzanas​, Pahuatlán, Chignahuapan, Cholula, Tlatlauquitepec, Xicotepec, ​Atlixco, Huauchinango​​​​​​​​, Bernal, Jalpan de Serra, Cadereyta, ​Tequisquiapan, San Joaquín​​​​​​, Bacalar, Isla Mujeres, Tulum​​, Real de Catorce, ​Xilitla, Cosalá, El Fuerte, El Rosarito, Mocorito​​​​, Álamos, Magdalena de Kino, Tapijulapa, Mier, Tula, Huamantla,​ ​Tlaxco, Xico, ​Coatepec, ​Papantla, Coscomatepec, Orizaba, Zozocolco​​​​​, ​Izamal, Valladolid​, ​Jerez de García Salinas, Teul González Ortega, Sombrerete, Pinos, Nochistlán​​​​​"

def string_to_hash(str)
  str.split(',').map(&:strip).delete_if(&:nil?)
end

states_hash = string_to_hash(states).map.with_index { |element, indx| [indx, element]}.to_h

towns_hash = string_to_hash(magic_towns).map.with_index { | element, indx | [ indx, element]}.to_h

# //tr/td/a -> gets all the town names