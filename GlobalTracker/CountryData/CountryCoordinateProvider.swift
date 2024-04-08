//
//  CountryCoordinateProvider.swift
//  GlobalTracker
//
//  Created by AndreShan on 2024-04-07.
//

import Foundation
import CoreLocation

class CountryCoordinateProvider {
    // Dictionary to store country names and their corresponding coordinates
    static let countryCoordinates: [String: CLLocationCoordinate2D] = [
        "Afghanistan": CLLocationCoordinate2D(latitude: 33.93911, longitude: 67.709953),
        "Albania": CLLocationCoordinate2D(latitude: 41.1533, longitude: 20.1683),
        "Algeria": CLLocationCoordinate2D(latitude: 28.0339, longitude: 1.6596),
        "Andorra": CLLocationCoordinate2D(latitude: 42.5063, longitude: 1.5218),
        "Angola": CLLocationCoordinate2D(latitude: -11.2027, longitude: 17.8739),
        "Antigua and Barbuda": CLLocationCoordinate2D(latitude: 17.0608, longitude: -61.7964),
        "Argentina": CLLocationCoordinate2D(latitude: -38.4161, longitude: -63.6167),
        "Armenia": CLLocationCoordinate2D(latitude: 40.0691, longitude: 45.0382),
        "Australia": CLLocationCoordinate2D(latitude: -25.2744, longitude: 133.7751),
        "Austria": CLLocationCoordinate2D(latitude: 47.5162, longitude: 14.5501),

        "Azerbaijan": CLLocationCoordinate2D(latitude: 40.1431, longitude: 47.5769),
        "Bahamas": CLLocationCoordinate2D(latitude: 25.0343, longitude: -77.3963),
        "Bahrain": CLLocationCoordinate2D(latitude: 26.0667, longitude: 50.5577),
        "Bangladesh": CLLocationCoordinate2D(latitude: 23.685, longitude: 90.3563),
        "Barbados": CLLocationCoordinate2D(latitude: 13.1939, longitude: -59.5432),
        "Belarus": CLLocationCoordinate2D(latitude: 53.7098, longitude: 27.9534),
        "Belgium": CLLocationCoordinate2D(latitude: 50.5039, longitude: 4.4699),
        "Belize": CLLocationCoordinate2D(latitude: 17.1899, longitude: -88.4976),
        "Benin": CLLocationCoordinate2D(latitude: 9.3077, longitude: 2.3158),
        "Bhutan": CLLocationCoordinate2D(latitude: 27.5142, longitude: 90.4336),

        "Bolivia": CLLocationCoordinate2D(latitude: -16.2902, longitude: -63.5887),
        "Bosnia and Herzegovina": CLLocationCoordinate2D(latitude: 43.9159, longitude: 17.6791),
        "Botswana": CLLocationCoordinate2D(latitude: -22.3285, longitude: 24.6849),
        "Brazil": CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
        "Brunei": CLLocationCoordinate2D(latitude: 4.5353, longitude: 114.7277),
        "Bulgaria": CLLocationCoordinate2D(latitude: 42.7339, longitude: 25.4858),
        "Burkina Faso": CLLocationCoordinate2D(latitude: 12.2383, longitude: -1.5616),
        "Burundi": CLLocationCoordinate2D(latitude: -3.3731, longitude: 29.9189),
        "Cabo Verde": CLLocationCoordinate2D(latitude: 16.5388, longitude: -23.0418),
        "Cambodia": CLLocationCoordinate2D(latitude: 12.5657, longitude: 104.9910),

        "Cameroon": CLLocationCoordinate2D(latitude: 7.3697, longitude: 12.3547),
        "Canada": CLLocationCoordinate2D(latitude: 56.1304, longitude: -106.3468),
        "Central African Republic": CLLocationCoordinate2D(latitude: 6.6111, longitude: 20.9394),
        "Chad": CLLocationCoordinate2D(latitude: 15.4542, longitude: 18.7322),
        "Chile": CLLocationCoordinate2D(latitude: -35.6751, longitude: -71.5430),
        "China": CLLocationCoordinate2D(latitude: 35.8617, longitude: 104.1954),
        "Colombia": CLLocationCoordinate2D(latitude: 4.5709, longitude: -74.2973),
        "Comoros": CLLocationCoordinate2D(latitude: -11.6455, longitude: 43.3333),
        "Democratic Republic of the Congo": CLLocationCoordinate2D(latitude: -4.0383, longitude: 21.7587),
        "Republic of the Congo": CLLocationCoordinate2D(latitude: -0.2280, longitude: 15.8277),

        "Costa Rica": CLLocationCoordinate2D(latitude: 9.7489, longitude: -83.7534),
        "Cote d'Ivoire": CLLocationCoordinate2D(latitude: 7.5399, longitude: -5.5471),
        "Croatia": CLLocationCoordinate2D(latitude: 45.1, longitude: 15.2),
        "Cuba": CLLocationCoordinate2D(latitude: 21.5218, longitude: -77.7812),
        "Cyprus": CLLocationCoordinate2D(latitude: 35.1264, longitude: 33.4299),
        "Czech Republic": CLLocationCoordinate2D(latitude: 49.8175, longitude: 15.4730),
        "Denmark": CLLocationCoordinate2D(latitude: 56.2639, longitude: 9.5018),
        "Djibouti": CLLocationCoordinate2D(latitude: 11.8251, longitude: 42.5903),
        "Dominica": CLLocationCoordinate2D(latitude: 15.4149, longitude: -61.3709),
        "Dominican Republic": CLLocationCoordinate2D(latitude: 18.7357, longitude: -70.1627),

        "Ecuador": CLLocationCoordinate2D(latitude: -1.8312, longitude: -78.1834),
        "Egypt": CLLocationCoordinate2D(latitude: 26.8206, longitude: 30.8025),
        "El Salvador": CLLocationCoordinate2D(latitude: 13.7942, longitude: -88.8965),
        "Equatorial Guinea": CLLocationCoordinate2D(latitude: 1.6508, longitude: 10.2679),
        "Eritrea": CLLocationCoordinate2D(latitude: 15.1794, longitude: 39.7823),
        "Estonia": CLLocationCoordinate2D(latitude: 58.5953, longitude: 25.0136),
        "Eswatini": CLLocationCoordinate2D(latitude: -26.5225, longitude: 31.4659),
        "Ethiopia": CLLocationCoordinate2D(latitude: 9.1450, longitude: 40.4897),
        "Fiji": CLLocationCoordinate2D(latitude: -17.7134, longitude: 178.0650),
        "Finland": CLLocationCoordinate2D(latitude: 61.9241, longitude: 25.7482),

        "France": CLLocationCoordinate2D(latitude: 46.2276, longitude: 2.2137),
        "Gabon": CLLocationCoordinate2D(latitude: -0.8037, longitude: 11.6094),
        "Gambia": CLLocationCoordinate2D(latitude: 13.4432, longitude: -15.3101),
        "Georgia": CLLocationCoordinate2D(latitude: 42.3154, longitude: 43.3569),
        "Germany": CLLocationCoordinate2D(latitude: 51.1657, longitude: 10.4515),
        "Ghana": CLLocationCoordinate2D(latitude: 7.9465, longitude: -1.0232),
        "Greece": CLLocationCoordinate2D(latitude: 39.0742, longitude: 21.8243),
        "Grenada": CLLocationCoordinate2D(latitude: 12.1165, longitude: -61.6790),
        "Guatemala": CLLocationCoordinate2D(latitude: 15.7835, longitude: -90.2308),
        "Guinea": CLLocationCoordinate2D(latitude: 9.9456, longitude: -9.6966),

        "Guinea-Bissau": CLLocationCoordinate2D(latitude: 11.8037, longitude: -15.1804),
        "Guyana": CLLocationCoordinate2D(latitude: 4.8604, longitude: -58.9302),
        "Haiti": CLLocationCoordinate2D(latitude: 18.9712, longitude: -72.2852),
        "Honduras": CLLocationCoordinate2D(latitude: 15.2000, longitude: -86.2419),
        "Hungary": CLLocationCoordinate2D(latitude: 47.1625, longitude: 19.5033),
        "Iceland": CLLocationCoordinate2D(latitude: 64.9631, longitude: -19.0208),
        "India": CLLocationCoordinate2D(latitude: 20.5937, longitude: 78.9629),
        "Indonesia": CLLocationCoordinate2D(latitude: -0.7893, longitude: 113.9213),
        "Iran": CLLocationCoordinate2D(latitude: 32.4279, longitude: 53.6880),
        "Iraq": CLLocationCoordinate2D(latitude: 33.2232, longitude: 43.6793),

        "Ireland": CLLocationCoordinate2D(latitude: 53.4129, longitude: -8.2439),
        "Israel": CLLocationCoordinate2D(latitude: 31.0461, longitude: 34.8516),
        "Italy": CLLocationCoordinate2D(latitude: 41.8719, longitude: 12.5674),
        "Jamaica": CLLocationCoordinate2D(latitude: 18.1096, longitude: -77.2975),
        "Japan": CLLocationCoordinate2D(latitude: 36.2048, longitude: 138.2529),
        "Jordan": CLLocationCoordinate2D(latitude: 30.5852, longitude: 36.2384),
        "Kazakhstan": CLLocationCoordinate2D(latitude: 48.0196, longitude: 66.9237),
        "Kenya": CLLocationCoordinate2D(latitude: -0.0236, longitude: 37.9062),
        "Kiribati": CLLocationCoordinate2D(latitude: -3.3704, longitude: -168.7340),
        "Korea, North": CLLocationCoordinate2D(latitude: 40.3399, longitude: 127.5101),

        "Korea, South": CLLocationCoordinate2D(latitude: 35.9078, longitude: 127.7669),
        "Kosovo": CLLocationCoordinate2D(latitude: 42.6026, longitude: 20.9029),
        "Kuwait": CLLocationCoordinate2D(latitude: 29.3759, longitude: 47.9774),
        "Kyrgyzstan": CLLocationCoordinate2D(latitude: 41.2044, longitude: 74.7661),
        "Laos": CLLocationCoordinate2D(latitude: 19.8563, longitude: 102.4955),
        "Latvia": CLLocationCoordinate2D(latitude: 56.8796, longitude: 24.6032),
        "Lebanon": CLLocationCoordinate2D(latitude: 33.8547, longitude: 35.8623),
        "Lesotho": CLLocationCoordinate2D(latitude: -29.609988, longitude: 28.2336),
        "Liberia": CLLocationCoordinate2D(latitude: 6.4281, longitude: -9.4295),
        "Libya": CLLocationCoordinate2D(latitude: 26.3351, longitude: 17.2283),

        "Liechtenstein": CLLocationCoordinate2D(latitude: 47.1660, longitude: 9.5554),
        "Lithuania": CLLocationCoordinate2D(latitude: 55.1694, longitude: 23.8813),
        "Luxembourg": CLLocationCoordinate2D(latitude: 49.8153, longitude: 6.1296),
        "Madagascar": CLLocationCoordinate2D(latitude: -18.7669, longitude: 46.8691),
        "Malawi": CLLocationCoordinate2D(latitude: -13.2543, longitude: 34.3015),
        "Malaysia": CLLocationCoordinate2D(latitude: 4.2105, longitude: 101.9758),
        "Maldives": CLLocationCoordinate2D(latitude: 3.2028, longitude: 73.2207),
        "Mali": CLLocationCoordinate2D(latitude: 17.5707, longitude: -3.9962),
        "Malta": CLLocationCoordinate2D(latitude: 35.9375, longitude: 14.3754),
        "Marshall Islands": CLLocationCoordinate2D(latitude: 7.1315, longitude: 171.1845),

        "Mauritania": CLLocationCoordinate2D(latitude: 21.0079, longitude: -10.9408),
        "Mauritius": CLLocationCoordinate2D(latitude: -20.3484, longitude: 57.5522),
        "Mexico": CLLocationCoordinate2D(latitude: 23.6345, longitude: -102.5528),
        "Micronesia": CLLocationCoordinate2D(latitude: 7.4256, longitude: 150.5508),
        "Moldova": CLLocationCoordinate2D(latitude: 47.4116, longitude: 28.3699),
        "Monaco": CLLocationCoordinate2D(latitude: 43.7384, longitude: 7.4246),
        "Mongolia": CLLocationCoordinate2D(latitude: 46.8625, longitude: 103.8467),
        "Montenegro": CLLocationCoordinate2D(latitude: 42.7087, longitude: 19.3744),
        "Morocco": CLLocationCoordinate2D(latitude: 31.7917, longitude: -7.0926),
        "Mozambique": CLLocationCoordinate2D(latitude: -18.6657, longitude: 35.5296),

        "Myanmar": CLLocationCoordinate2D(latitude: 21.9162, longitude: 95.9560),
        "Namibia": CLLocationCoordinate2D(latitude: -22.9576, longitude: 18.4904),
        "Nauru": CLLocationCoordinate2D(latitude: -0.5228, longitude: 166.9315),
        "Nepal": CLLocationCoordinate2D(latitude: 28.3949, longitude: 84.1240),
        "Netherlands": CLLocationCoordinate2D(latitude: 52.1326, longitude: 5.2913),
        "New Zealand": CLLocationCoordinate2D(latitude: -40.9006, longitude: 174.8860),
        "Nicaragua": CLLocationCoordinate2D(latitude: 12.8654, longitude: -85.2072),
        "Niger": CLLocationCoordinate2D(latitude: 17.6078, longitude: 8.0817),
        "Nigeria": CLLocationCoordinate2D(latitude: 9.0820, longitude: 8.6753),
        "North Macedonia": CLLocationCoordinate2D(latitude: 41.6086, longitude: 21.7453),

        "Norway": CLLocationCoordinate2D(latitude: 60.4720, longitude: 8.4689),
        "Oman": CLLocationCoordinate2D(latitude: 21.5126, longitude: 55.9233),
        "Pakistan": CLLocationCoordinate2D(latitude: 30.3753, longitude: 69.3451),
        "Palau": CLLocationCoordinate2D(latitude: 7.5149, longitude: 134.5825),
        "Palestine State": CLLocationCoordinate2D(latitude: 31.9522, longitude: 35.2332),
        "Panama": CLLocationCoordinate2D(latitude: 8.53798, longitude: -80.7821),
        "Papua New Guinea": CLLocationCoordinate2D(latitude: -6.31499, longitude: 143.9555),
        "Paraguay": CLLocationCoordinate2D(latitude: -23.4425, longitude: -58.4438),
        "Peru": CLLocationCoordinate2D(latitude: -9.18997, longitude: -75.0152),
        "Philippines": CLLocationCoordinate2D(latitude: 12.8797, longitude: 121.7740),

        "Poland": CLLocationCoordinate2D(latitude: 51.9194, longitude: 19.1451),
        "Portugal": CLLocationCoordinate2D(latitude: 39.3999, longitude: -8.2245),
        "Qatar": CLLocationCoordinate2D(latitude: 25.3548, longitude: 51.1839),
        "Romania": CLLocationCoordinate2D(latitude: 45.9432, longitude: 24.9668),
        "Russia": CLLocationCoordinate2D(latitude: 61.5240, longitude: 105.3188),
        "Rwanda": CLLocationCoordinate2D(latitude: -1.9403, longitude: 29.8739),
        "Saint Kitts and Nevis": CLLocationCoordinate2D(latitude: 17.3578, longitude: -62.7830),
        "Saint Lucia": CLLocationCoordinate2D(latitude: 13.9094, longitude: -60.9789),
        "Saint Vincent and the Grenadines": CLLocationCoordinate2D(latitude: 12.9843, longitude: -61.2872),
        "Samoa": CLLocationCoordinate2D(latitude: -13.7590, longitude: -172.1046),

        "San Marino": CLLocationCoordinate2D(latitude: 43.9424, longitude: 12.4578),
        "Sao Tome and Principe": CLLocationCoordinate2D(latitude: 0.1864, longitude: 6.6131),
        "Saudi Arabia": CLLocationCoordinate2D(latitude: 23.8859, longitude: 45.0792),
        "Senegal": CLLocationCoordinate2D(latitude: 14.4974, longitude: -14.4524),
        "Serbia": CLLocationCoordinate2D(latitude: 44.0165, longitude: 21.0059),
        "Seychelles": CLLocationCoordinate2D(latitude: -4.6796, longitude: 55.4920),
        "Sierra Leone": CLLocationCoordinate2D(latitude: 8.4606, longitude: -11.7799),
        "Singapore": CLLocationCoordinate2D(latitude: 1.3521, longitude: 103.8198),
        "Slovakia": CLLocationCoordinate2D(latitude: 48.6690, longitude: 19.6990),
        "Slovenia": CLLocationCoordinate2D(latitude: 46.1512, longitude: 14.9955),

        "Solomon Islands": CLLocationCoordinate2D(latitude: -9.6457, longitude: 160.1562),
        "Somalia": CLLocationCoordinate2D(latitude: 5.1521, longitude: 46.1996),
        "South Africa": CLLocationCoordinate2D(latitude: -30.5595, longitude: 22.9375),
        "South Sudan": CLLocationCoordinate2D(latitude: 6.8769, longitude: 31.3069),
        "Spain": CLLocationCoordinate2D(latitude: 40.4637, longitude: -3.7492),
        "Sri Lanka": CLLocationCoordinate2D(latitude: 7.8731, longitude: 80.7718),
        "Sudan": CLLocationCoordinate2D(latitude: 12.8628, longitude: 30.2176),
        "Suriname": CLLocationCoordinate2D(latitude: 3.9193, longitude: -56.0278),
        "Sweden": CLLocationCoordinate2D(latitude: 60.1282, longitude: 18.6435),
        "Switzerland": CLLocationCoordinate2D(latitude: 46.8182, longitude: 8.2275),

        "Syria": CLLocationCoordinate2D(latitude: 34.8021, longitude: 38.9968),
        "Tajikistan": CLLocationCoordinate2D(latitude: 38.8610, longitude: 71.2761),
        "Tanzania": CLLocationCoordinate2D(latitude: -6.3690, longitude: 34.8888),
        "Thailand": CLLocationCoordinate2D(latitude: 15.8700, longitude: 100.9925),
        "Timor-Leste": CLLocationCoordinate2D(latitude: -8.8742, longitude: 125.7275),
        "Togo": CLLocationCoordinate2D(latitude: 8.6195, longitude: 0.8248),
        "Tonga": CLLocationCoordinate2D(latitude: -21.1789, longitude: -175.1982),
        "Trinidad and Tobago": CLLocationCoordinate2D(latitude: 10.6918, longitude: -61.2225),
        "Tunisia": CLLocationCoordinate2D(latitude: 33.8869, longitude: 9.5375),
        "Turkey": CLLocationCoordinate2D(latitude: 38.9637, longitude: 35.2433),

        "Turkmenistan": CLLocationCoordinate2D(latitude: 38.9697, longitude: 59.5563),
        "Tuvalu": CLLocationCoordinate2D(latitude: -7.1095, longitude: 177.6493),
        "Uganda": CLLocationCoordinate2D(latitude: 1.3733, longitude: 32.2903),
        "Ukraine": CLLocationCoordinate2D(latitude: 48.3794, longitude: 31.1656),
        "United Arab Emirates": CLLocationCoordinate2D(latitude: 23.4241, longitude: 53.8478),
        "United Kingdom": CLLocationCoordinate2D(latitude: 55.3781, longitude: -3.4360),
        "United States": CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129),
        "Uruguay": CLLocationCoordinate2D(latitude: -32.5228, longitude: -55.7658),
        "Uzbekistan": CLLocationCoordinate2D(latitude: 41.3775, longitude: 64.5853),
        "Vanuatu": CLLocationCoordinate2D(latitude: -15.3767, longitude: 166.9592),

        "Venezuela": CLLocationCoordinate2D(latitude: 6.4238, longitude: -66.5897),
        "Vietnam": CLLocationCoordinate2D(latitude: 14.0583, longitude: 108.2772),
        "Yemen": CLLocationCoordinate2D(latitude: 15.5527, longitude: 48.5164),
        "Zambia": CLLocationCoordinate2D(latitude: -13.1339, longitude: 27.8493),
        "Zimbabwe": CLLocationCoordinate2D(latitude: -19.0154, longitude: 29.1549)
    ]

    // Method to fetch the coordinates of a country by its name
    static func getCoordinates(for country: String) -> CLLocationCoordinate2D? {
        return countryCoordinates[country]
    }
}
