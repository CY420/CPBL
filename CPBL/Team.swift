//
//  Team.swift
//  CPBL
//
//  Created by 114-2Student03 on 2026/4/30.
//

import SwiftUI
import CoreLocation

struct Team: Identifiable {
    let id: UUID
    let name: String
    let englishName: String
    let mascot: String
    let homeStadium: String
    let championships: Int
    let historyDescription: String
    let themeColor: Color
    let imageNames: [String]
    let officialURL: String
    let logoImageName: String
    let stadiumCoordinate: CLLocationCoordinate2D
    
    init(
        name: String,
        englishName: String,
        mascot: String,
        homeStadium: String,
        championships: Int,
        historyDescription: String,
        themeColor: Color,
        imageNames: [String],
        officialURL: String,
        logoImageName: String,
        latitude: Double,
        longitude: Double
    ) {
        self.id = UUID()
        self.name = name
        self.englishName = englishName
        self.mascot = mascot
        self.homeStadium = homeStadium
        self.championships = championships
        self.historyDescription = historyDescription
        self.themeColor = themeColor
        self.imageNames = imageNames
        self.officialURL = officialURL
        self.logoImageName = logoImageName
        self.stadiumCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

let cpblTeams: [Team] = [
    Team(
        name: "味全龍",
        englishName: "Wei Chuan Dragons",
        mascot: "威弟 (Weidi)",
        homeStadium: "天母棒球場",
        championships: 5,
        historyDescription: "味全龍是中華職棒的創始球隊之一，在職棒初期由總教練徐生明帶領下，曾締造三連霸的「龍朝」輝煌紀錄，擁有廣大且狂熱的球迷。1999年因故解散後，球迷的呼喚未曾停歇。終於在2019年，味全龍宣布重返中職，從二軍起步穩紮穩打。回歸一軍後，球隊展現年輕活力與堅強韌性，並在2023年奪下回歸後的首座、也是隊史第五座總冠軍，完成浴火重生的壯舉。如今「紅色狂潮」再次席捲全台，主場應援氣氛熱烈，是中職最具話題性的球隊之一。",
        themeColor: Color(red: 0.8, green: 0.1, blue: 0.1),
        imageNames: ["dragons1", "dragons2", "dragons3"],
        officialURL: "https://www.wdragons.com/",
        logoImageName: "dragons_logo",
        latitude: 25.114083,
        longitude: 121.535167
    ),
    Team(
        name: "中信兄弟",
        englishName: "CTBC Brothers",
        mascot: "小翔 (Sean)",
        homeStadium: "臺中洲際棒球場",
        championships: 10,
        historyDescription: "球隊前身為「兄弟象」，是中職歷史最悠久、人氣最高的傳統名門，擁有「百萬象迷」的稱號，黃色球衣是台灣棒球的經典象徵。2014年由中信金控接手後更名為中信兄弟，並持續深耕台中主場，將洲際棒球場打造成台灣極具規模的職業主場。近年球隊戰力穩定且板凳深度充足，在2021與2022年完成二連霸，並於2024年奪下隊史第十座總冠軍。球隊的「炸裂」應援曲深植人心，無論主客場都能看見令人震撼的黃衫軍應援海。",
        themeColor: Color(red: 1.0, green: 0.84, blue: 0.0),
        imageNames: ["brothers1", "brothers2", "brothers3"],
        officialURL: "https://www.brothers.tw/",
        logoImageName: "brothers_logo",
        latitude: 24.200083,
        longitude: 120.685306
    ),
    Team(
        name: "統一 7-ELEVEn 獅",
        englishName: "Uni-President 7-Eleven Lions",
        mascot: "萊恩 (Lion)",
        homeStadium: "亞太國際棒球訓練中心",
        championships: 10,
        historyDescription: "統一獅是中華職棒目前唯一從元年（1990年）至今未曾易主或更名的創始球隊，與中信兄弟並列為擁有最多總冠軍的歷史名門。球隊長期以台南為大本營，深耕南台灣基層棒球，培育出無數頂尖的本土球星。隊史擁有傲人的三連霸紀錄（2007-2009）。統一獅以穩健的經營作風著稱，近年來在行銷與主場活動上也積極融入年輕化元素。台南主場的獨特在地美食與濃厚的人情味，讓統一獅成為最具南台灣在地特色的職棒隊伍。",
        themeColor: Color(red: 1.0, green: 0.6, blue: 0.0),
        imageNames: ["lions1", "lions2", "lions3"],
        officialURL: "https://www.uni-lions.com.tw/",
        logoImageName: "lions_logo",
        latitude: 23.062762,
        longitude: 120.236427
    ),
    Team(
        name: "樂天桃猿",
        englishName: "Rakuten Monkeys",
        mascot: "猿氣小子 (Monkey)",
        homeStadium: "樂天桃園棒球場",
        championships: 7,
        historyDescription: "球隊前身為La New熊與Lamigo桃猿。在Lamigo時期，球隊將主場遷至桃園，大刀闊斧推動「全猿主場」，將電子舞曲、獨創應援動作與啦啦隊完美結合，徹底顛覆了台灣職棒的看球生態，並締造八年六冠的傲人成績。2020年由日本樂天集團接手後更名為樂天桃猿，延續強悍的「暴力猿」打擊火力與極具娛樂性的主場氛圍。旗下的Rakuten Girls啦啦隊更是屢屢躍上國際版面，成為台灣職棒獨特的次文化與行銷指標。",
        themeColor: Color(red: 0.67, green: 0.1, blue: 0.2),
        imageNames: ["monkeys1", "monkeys2", "monkeys3"],
        officialURL: "https://monkeys.rakuten.com.tw/",
        logoImageName: "monkeys_logo",
        latitude: 25.001314,
        longitude: 121.201619
    ),
    Team(
        name: "富邦悍將",
        englishName: "Fubon Guardians",
        mascot: "富藍奇 (Frankie)",
        homeStadium: "新莊棒球場",
        championships: 3,
        historyDescription: "前身歷經俊國熊、興農牛與義大犀牛等時期。2016年義大犀牛奪下總冠軍後，由富邦金控接手並更名為富邦悍將。球隊以「Guardians」為名，象徵守護棒球與球迷的決心。富邦接手後投入大量資源認養並徹底改造新莊棒球場，提供球迷極佳的餐飲與觀賽體驗，硬體設施堪稱中職頂尖。雖然球隊近年戰績尚在重整階段，但持續透過選秀引進潛力新星，並擁有廣大死忠的北部球迷，專屬啦啦隊Fubon Angels亦擁有極高的人氣。",
        themeColor: Color(red: 0.0, green: 0.3, blue: 0.8),
        imageNames: ["guardians1", "guardians2", "guardians3"],
        officialURL: "https://www.fubonguardians.com/",
        logoImageName: "guardians_logo",
        latitude: 25.040833,
        longitude: 121.447500
    ),
    Team(
        name: "台鋼雄鷹",
        englishName: "TSG Hawks",
        mascot: "鷹雄 (TAKAO)",
        homeStadium: "澄清湖棒球場",
        championships: 0,
        historyDescription: "台鋼雄鷹是中華職棒的第六隊，於2022年由台灣鋼鐵集團籌組成立，讓中職時隔多年再次重返六隊規模。球隊以高雄澄清湖棒球場為主場，主打深耕南部在地化。在傳奇教頭洪一中的帶領下，球隊從零開始建軍，先在2023年奪下二軍總冠軍及亞洲冬季棒球聯盟冠軍，2024年正式投入一軍賽事。陣中結合了經驗豐富的旅外歸國好手與充滿拼勁的年輕新秀，加上引人注目的Wing Stars啦啦隊，為中職注入了全新的活力與話題。",
        themeColor: Color(red: 0.2, green: 0.5, blue: 0.3),
        imageNames: ["eagles1", "eagles2", "eagles3"],
        officialURL: "https://www.tsghawks.com/",
        logoImageName: "eagles_logo",
        latitude: 22.654414,
        longitude: 120.359086
    )
]
