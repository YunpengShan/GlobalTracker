//
//  CountryFlagProvider.swift
//  GlobalTracker
//
//  Created by AndreShan on 2024-04-06.
//

import Foundation

class CountryFlagProvider {
    static func getFlagEmoji(for countryName: String) -> String {
        switch countryName {
        case "Afghanistan":
            return "🇦🇫"
        case "Albania":
            return "🇦🇱"
        case "Algeria":
            return "🇩🇿"
        case "Andorra":
            return "🇦🇩"
        case "Angola":
            return "🇦🇴"
        case "Antigua and Barbuda":
            return "🇦🇬"
        case "Argentina":
            return "🇦🇷"
        case "Armenia":
            return "🇦🇲"
        case "Australia":
            return "🇦🇺"
        case "Austria":
            return "🇦🇹"
            
        case "Azerbaijan":
            return "🇦🇿"
        case "Bahamas":
            return "🇧🇸"
        case "Bahrain":
            return "🇧🇭"
        case "Bangladesh":
            return "🇧🇩"
        case "Barbados":
            return "🇧🇧"
        case "Belarus":
            return "🇧🇾"
        case "Belgium":
            return "🇧🇪"
        case "Belize":
            return "🇧🇿"
        case "Benin":
            return "🇧🇯"
        case "Bhutan":
            return "🇧🇹"
            
        case "Bolivia":
            return "🇧🇴"
        case "Bosnia and Herzegovina":
            return "🇧🇦"
        case "Botswana":
            return "🇧🇼"
        case "Brazil":
            return "🇧🇷"
        case "Brunei":
            return "🇧🇳"
        case "Bulgaria":
            return "🇧🇬"
        case "Burkina Faso":
            return "🇧🇫"
        case "Burundi":
            return "🇧🇮"
        case "Cabo Verde":
            return "🇨🇻"
        case "Cambodia":
            return "🇰🇭"
            
        case "Cameroon":
            return "🇨🇲"
        case "Canada":
            return "🇨🇦"
        case "Central African Republic":
            return "🇨🇫"
        case "Chad":
            return "🇹🇩"
        case "Chile":
            return "🇨🇱"
        case "China":
            return "🇨🇳"
        case "Colombia":
            return "🇨🇴"
        case "Comoros":
            return "🇰🇲"
        case "Democratic Republic of the Congo":
            return "🇨🇩"
        case "Republic of the Congo":
            return "🇨🇬"
            
        case "Costa Rica":
            return "🇨🇷"
        case "Cote d'Ivoire":
            return "🇨🇮"
        case "Croatia":
            return "🇭🇷"
        case "Cuba":
            return "🇨🇺"
        case "Cyprus":
            return "🇨🇾"
        case "Czech Republic":
            return "🇨🇿"
        case "Denmark":
            return "🇩🇰"
        case "Djibouti":
            return "🇩🇯"
        case "Dominica":
            return "🇩🇲"
        case "Dominican Republic":
            return "🇩🇴"
            
        case "Ecuador":
            return "🇪🇨"
        case "Egypt":
            return "🇪🇬"
        case "El Salvador":
            return "🇸🇻"
        case "Equatorial Guinea":
            return "🇬🇶"
        case "Eritrea":
            return "🇪🇷"
        case "Estonia":
            return "🇪🇪"
        case "Eswatini":
            return "🇸🇿"
        case "Ethiopia":
            return "🇪🇹"
        case "Fiji":
            return "🇫🇯"
        case "Finland":
            return "🇫🇮"
            
        case "France":
            return "🇫🇷"
        case "Gabon":
            return "🇬🇦"
        case "Gambia":
            return "🇬🇲"
        case "Georgia":
            return "🇬🇪"
        case "Germany":
            return "🇩🇪"
        case "Ghana":
            return "🇬🇭"
        case "Greece":
            return "🇬🇷"
        case "Grenada":
            return "🇬🇩"
        case "Guatemala":
            return "🇬🇹"
        case "Guinea":
            return "🇬🇳"
            
        case "Guinea-Bissau":
            return "🇬🇼"
        case "Guyana":
            return "🇬🇾"
        case "Haiti":
            return "🇭🇹"
        case "Honduras":
            return "🇭🇳"
        case "Hungary":
            return "🇭🇺"
        case "Iceland":
            return "🇮🇸"
        case "India":
            return "🇮🇳"
        case "Indonesia":
            return "🇮🇩"
        case "Iran":
            return "🇮🇷"
        case "Iraq":
            return "🇮🇶"
            
        case "Ireland":
            return "🇮🇪"
        case "Israel":
            return "🇮🇱"
        case "Italy":
            return "🇮🇹"
        case "Jamaica":
            return "🇯🇲"
        case "Japan":
            return "🇯🇵"
        case "Jordan":
            return "🇯🇴"
        case "Kazakhstan":
            return "🇰🇿"
        case "Kenya":
            return "🇰🇪"
        case "Kiribati":
            return "🇰🇮"
        case "Korea, North":
            return "🇰🇵"
            
        case "Korea, South":
            return "🇰🇷"
        case "Kosovo":
            return "🇽🇰"
        case "Kuwait":
            return "🇰🇼"
        case "Kyrgyzstan":
            return "🇰🇬"
        case "Laos":
            return "🇱🇦"
        case "Latvia":
            return "🇱🇻"
        case "Lebanon":
            return "🇱🇧"
        case "Lesotho":
            return "🇱🇸"
        case "Liberia":
            return "🇱🇷"
        case "Libya":
            return "🇱🇾"
            
        case "Liechtenstein":
            return "🇱🇮"
        case "Lithuania":
            return "🇱🇹"
        case "Luxembourg":
            return "🇱🇺"
        case "Madagascar":
            return "🇲🇬"
        case "Malawi":
            return "🇲🇼"
        case "Malaysia":
            return "🇲🇾"
        case "Maldives":
            return "🇲🇻"
        case "Mali":
            return "🇲🇱"
        case "Malta":
            return "🇲🇹"
        case "Marshall Islands":
            return "🇲🇭"
            
        case "Mauritania":
            return "🇲🇷"
        case "Mauritius":
            return "🇲🇺"
        case "Mexico":
            return "🇲🇽"
        case "Micronesia":
            return "🇫🇲"
        case "Moldova":
            return "🇲🇩"
        case "Monaco":
            return "🇲🇨"
        case "Mongolia":
            return "🇲🇳"
        case "Montenegro":
            return "🇲🇪"
        case "Morocco":
            return "🇲🇦"
        case "Mozambique":
            return "🇲🇿"
            
        case "Myanmar":
            return "🇲🇲"
        case "Namibia":
            return "🇳🇦"
        case "Nauru":
            return "🇳🇷"
        case "Nepal":
            return "🇳🇵"
        case "Netherlands":
            return "🇳🇱"
        case "New Zealand":
            return "🇳🇿"
        case "Nicaragua":
            return "🇳🇮"
        case "Niger":
            return "🇳🇪"
        case "Nigeria":
            return "🇳🇬"
        case "North Macedonia":
            return "🇲🇰"
            
        case "Norway":
            return "🇳🇴"
        case "Oman":
            return "🇴🇲"
        case "Pakistan":
            return "🇵🇰"
        case "Palau":
            return "🇵🇼"
        case "Palestine State":
            return "🇵🇸"
        case "Panama":
            return "🇵🇦"
        case "Papua New Guinea":
            return "🇵🇬"
        case "Paraguay":
            return "🇵🇾"
        case "Peru":
            return "🇵🇪"
        case "Philippines":
            return "🇵🇭"
            
        case "Poland":
            return "🇵🇱"
        case "Portugal":
            return "🇵🇹"
        case "Qatar":
            return "🇶🇦"
        case "Romania":
            return "🇷🇴"
        case "Russia":
            return "🇷🇺"
        case "Rwanda":
            return "🇷🇼"
        case "Saint Kitts and Nevis":
            return "🇰🇳"
        case "Saint Lucia":
            return "🇱🇨"
        case "Saint Vincent and the Grenadines":
            return "🇻🇨"
        case "Samoa":
            return "🇼🇸"
            
        case "San Marino":
            return "🇸🇲"
        case "Sao Tome and Principe":
            return "🇸🇹"
        case "Saudi Arabia":
            return "🇸🇦"
        case "Senegal":
            return "🇸🇳"
        case "Serbia":
            return "🇷🇸"
        case "Seychelles":
            return "🇸🇨"
        case "Sierra Leone":
            return "🇸🇱"
        case "Singapore":
            return "🇸🇬"
        case "Slovakia":
            return "🇸🇰"
        case "Slovenia":
            return "🇸🇮"
            
        case "Solomon Islands":
            return "🇸🇧"
        case "Somalia":
            return "🇸🇴"
        case "South Africa":
            return "🇿🇦"
        case "South Sudan":
            return "🇸🇸"
        case "Spain":
            return "🇪🇸"
        case "Sri Lanka":
            return "🇱🇰"
        case "Sudan":
            return "🇸🇩"
        case "Suriname":
            return "🇸🇷"
        case "Sweden":
            return "🇸🇪"
        case "Switzerland":
            return "🇨🇭"
            
        case "Syria":
            return "🇸🇾"
        case "Tajikistan":
            return "🇹🇯"
        case "Tanzania":
            return "🇹🇿"
        case "Thailand":
            return "🇹🇭"
        case "Timor-Leste":
            return "🇹🇱"
        case "Togo":
            return "🇹🇬"
        case "Tonga":
            return "🇹🇴"
        case "Trinidad and Tobago":
            return "🇹🇹"
        case "Tunisia":
            return "🇹🇳"
        case "Turkey":
            return "🇹🇷"
            
        case "Turkmenistan":
            return "🇹🇲"
        case "Tuvalu":
            return "🇹🇻"
        case "Uganda":
            return "🇺🇬"
        case "Ukraine":
            return "🇺🇦"
        case "United Arab Emirates":
            return "🇦🇪"
        case "United Kingdom":
            return "🇬🇧"
        case "United States":
            return "🇺🇸"
        case "Uruguay":
            return "🇺🇾"
        case "Uzbekistan":
            return "🇺🇿"
        case "Vanuatu":
            return "🇻🇺"
            
        case "Venezuela":
            return "🇻🇪"
        case "Vietnam":
            return "🇻🇳"
        case "Yemen":
            return "🇾🇪"
        case "Zambia":
            return "🇿🇲"
        case "Zimbabwe":
            return "🇿🇼"
        default:
            return "🏳️"
        }
    }
}
