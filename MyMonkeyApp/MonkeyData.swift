// MonkeyData.swift
// Helper class for monkey data and model
import Foundation

struct Monkey: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let details: String
    let image: String
    let population: Int
    let latitude: Double
    let longitude: Double
}

class MonkeyData {
    static let monkeys: [Monkey] = [
        Monkey(
            name: "Baboon",
            location: "Africa & Asia",
            details: "Baboons are large, ground-dwelling monkeys found in open savannah, open woodland, and hills across Africa and Arabia.",
            image: "https://raw.githubusercontent.com/jamesmontemagno/app-monkeys/master/baboon.jpg",
            population: 10000,
            latitude: 1.2921,
            longitude: 36.8219
        ),
        Monkey(
            name: "Capuchin Monkey",
            location: "Central & South America",
            details: "The capuchin monkeys are New World monkeys of the subfamily Cebinae. Prior to 2011, the subfamily contained only a single genus, Cebus.",
            image: "https://raw.githubusercontent.com/jamesmontemagno/app-monkeys/master/capuchin.jpg",
            population: 23000,
            latitude: 12.769013,
            longitude: -85.602364
        ),
        Monkey(
            name: "Blue Monkey",
            location: "Central and East Africa",
            details: "The blue monkey or diademed monkey is a species of Old World monkey native to Central and East Africa, ranging from the Congo Basin to the East African Rift.",
            image: "https://raw.githubusercontent.com/jamesmontemagno/app-monkeys/master/bluemonkey.jpg",
            population: 12000,
            latitude: -1.2921,
            longitude: 36.8219
        ),
        Monkey(
            name: "Squirrel Monkey",
            location: "Central & South America",
            details: "Squirrel monkeys are New World monkeys of the genus Saimiri. They are the only genus in the subfamily Saimiriinae.",
            image: "https://raw.githubusercontent.com/jamesmontemagno/app-monkeys/master/saimiri.jpg",
            population: 11000,
            latitude: -3.4653,
            longitude: -62.2159
        ),
        Monkey(
            name: "Golden Lion Tamarin",
            location: "Brazil",
            details: "The golden lion tamarin also known as the golden marmoset, is a small New World monkey of the family Callitrichidae.",
            image: "https://raw.githubusercontent.com/jamesmontemagno/app-monkeys/master/tamarin.jpg",
            population: 19000,
            latitude: -14.235004,
            longitude: -51.92528
        ),
        Monkey(
            name: "Howler Monkey",
            location: "South America",
            details: "Howler monkeys are among the largest of the New World monkeys. Fifteen species are currently recognised. Previously classified in the family Cebidae, they are now placed in the family Atelidae.",
            image: "https://raw.githubusercontent.com/jamesmontemagno/app-monkeys/master/alouatta.jpg",
            population: 8000,
            latitude: -8.783195,
            longitude: -55.491477
        ),
        Monkey(
            name: "Japanese Macaque",
            location: "Japan",
            details: "The Japanese macaque, is a terrestrial Old World monkey species native to Japan. They are also sometimes known as the snow monkey because they live in areas where snow covers the ground for months each year.",
            image: "https://raw.githubusercontent.com/jamesmontemagno/app-monkeys/master/macasa.jpg",
            population: 1000,
            latitude: 36.204824,
            longitude: 138.252924
        ),
        Monkey(
            name: "Mandrill",
            location: "Southern Cameroon, Gabon, and Congo",
            details: "The mandrill is a primate of the Old World monkey family, closely related to the baboons and even more closely to the drill.",
            image: "https://raw.githubusercontent.com/jamesmontemagno/app-monkeys/master/mandrill.jpg",
            population: 17000,
            latitude: -0.8037,
            longitude: 11.6094
        ),
        Monkey(
            name: "Proboscis Monkey",
            location: "Borneo",
            details: "The proboscis monkey or long-nosed monkey, known as the bekantan in Malay, is a reddish-brown arboreal Old World monkey that is endemic to the south-east Asian island of Borneo.",
            image: "https://raw.githubusercontent.com/jamesmontemagno/app-monkeys/master/borneo.jpg",
            population: 15000,
            latitude: 0.961883,
            longitude: 114.55485
        ),
        Monkey(
            name: "Red-shanked douc",
            location: "Vietnam",
            details: "The red-shanked douc is a species of Old World monkey, among the most colourful of all primates. The douc is an arboreal and diurnal monkey that eats and sleeps in the trees of the forest.",
            image: "https://raw.githubusercontent.com/jamesmontemagno/app-monkeys/master/douc.jpg",
            population: 1300,
            latitude: 16.111648,
            longitude: 108.262122
        ),
        // Special monkeys
        Monkey(
            name: "Sebastian",
            location: "Unknown",
            details: "Sebastian is a special monkey with a mysterious past.",
            image: "https://raw.githubusercontent.com/jamesmontemagno/app-monkeys/master/sebastian.jpg",
            population: 1,
            latitude: 0.0,
            longitude: 0.0
        ),
        Monkey(
            name: "Henry",
            location: "Unknown",
            details: "Henry is a wise old monkey who loves bananas.",
            image: "https://raw.githubusercontent.com/jamesmontemagno/app-monkeys/master/henry.jpg",
            population: 1,
            latitude: 0.0,
            longitude: 0.0
        ),
        Monkey(
            name: "Mooch",
            location: "Unknown",
            details: "Mooch is a playful monkey who enjoys swinging from trees.",
            image: "https://raw.githubusercontent.com/jamesmontemagno/app-monkeys/master/Mooch.PNG",
            population: 1,
            latitude: 0.0,
            longitude: 0.0
        )
    ]
}
