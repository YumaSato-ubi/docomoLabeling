//import APIKit
//import UIKit
//import AVFoundation
//
//class ViewController: UIViewController, AVAudioPlayerDelegate{
////    var histrorycontroller: HistoryTableViewController!
//    let api = APIManager.shared
//    var labelList = [[String: Any]()]
//    var audioPlayer: AVAudioPlayer!
//    var timer2: Timer?
//    
//    var hus_bathing_count = 0
//    var wife_bathing_count = 0
//    var hus_cooking_count = 0
//    var wife_cooking_count = 0
//    var hus_eating_count = 0
//    var wife_eating_count = 0
//    var hus_going_count = 0
//    var wife_going_count = 0
//    var hus_sleeping_count = 0
//    var wife_sleeping_count = 0
//
//    var count1 = 0
//    var count2 = 0
//    var count3 = 0
//    var count4 = 0
//    var count5 = 0
//    var icount1 = 0
//    var icount2 = 0
//    var icount3 = 0
//    var icount4 = 0
//    var icount5 = 0
//
//
//    @IBOutlet weak var View1: UIView!
//    
//    @IBOutlet weak var firstImage: UIImageView!
//    
//    @IBOutlet weak var secondImage: UIImageView!
//    
//    @IBOutlet weak var thirdImage: UIImageView!
//    
//    @IBOutlet weak var fourthImage: UIImageView!
//    
//    @IBOutlet weak var fifthImage: UIImageView!
//    
//    @IBOutlet weak var firstView: UIImageView!
//    
//    @IBOutlet weak var secondView: UIImageView!
//    
//    @IBOutlet weak var thirdView: UIImageView!
//    
//    @IBOutlet weak var fourthView: UIImageView!
//
//    @IBOutlet weak var fifthView: UIImageView!
//    
//    
//    @IBOutlet weak var Hisyo: UIImageView!
//    
//    @IBOutlet weak var Hukidashi: UIImageView!
//    
//    @IBOutlet weak var comment: UILabel!
//    
//    
//    @IBOutlet weak var hus_theme: UIImageView!
//    
//    @IBOutlet weak var wife_theme: UIImageView!
//    
//    
//    
//    var image1 = UIImage(named: "bathing")
//    var image11 = UIImage(named: "hus_bathing")
//    var image12 = UIImage(named: "wife_bathing")
//    var image2 = UIImage(named: "cooking")
//    var image21 = UIImage(named: "hus_cooking")
//    var image22 = UIImage(named: "wife_cooking")
//    var image3 = UIImage(named: "eating")
//    var image31 = UIImage(named: "hus_eating")
//    var image32 = UIImage(named: "wife_eating")
//    var image4 = UIImage(named: "going")
//    var image41 = UIImage(named: "hus_going")
//    var image42 = UIImage(named: "wife_going")
//    var image5 = UIImage(named: "sleeping")
//    var image51 = UIImage(named: "hus_sleeping")
//    var image52 = UIImage(named: "wife_sleeping")
//    
//    var imageHisyo = UIImage(named: "Hisho_hutuu")
//    var imageHukidashi = UIImage(named: "Hukidashi")
//    
//    var Hustheme = UIImage(named: "hus_theme")
//    var Wifetheme = UIImage(named: "wife_theme")
//
//    override func viewDidLoad() {
//        View1.contentMode = UIView.ContentMode.scaleAspectFit
//        var Rect1: CGRect
//        var Rect2: CGRect
//        var Rect3: CGRect
//        var Rect4: CGRect
//        var Rect5: CGRect
//        var iRect1: CGRect
//        var iRect2: CGRect
//        var iRect3: CGRect
//        var iRect4: CGRect
//        var iRect5: CGRect
//        var HisyoRect: CGRect
//        var HukidashiRect: CGRect
//        var HusRect: CGRect
//        var WifeRect: CGRect
//        var CommentRect: CGRect
//        
//        super.viewDidLoad()
//        Select()
//        self.comment.text = ""
//        
//        var timer1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.Select), userInfo: nil, repeats: true)
//        
//        
////
////        histrorycontroller.viewdelegate = self
//        Rect1 = CGRect(x: View1.frame.size.width/2, y: View1.frame.size.height/8, width: View1.frame.size.width/2, height: View1.frame.size.height/8)
//        Rect2 = CGRect(x: View1.frame.size.width/2, y: View1.frame.size.height * 2/8, width: View1.frame.size.width/2, height: View1.frame.size.height/8)
//        Rect3 = CGRect(x: View1.frame.size.width/2, y: View1.frame.size.height * 3/8, width: View1.frame.size.width/2, height: View1.frame.size.height/8)
//        Rect4 = CGRect(x: View1.frame.size.width/2, y: View1.frame.size.height * 4/8, width: View1.frame.size.width/2, height: View1.frame.size.height/8)
//        Rect5 = CGRect(x: View1.frame.size.width/2, y: View1.frame.size.height * 5/8, width: View1.frame.size.width/2, height: View1.frame.size.height/8)
//        
//        iRect1 = CGRect(x: 0, y: View1.frame.size.height/8, width: View1.frame.size.width/2, height: View1.frame.size.height/8)
//        iRect2 = CGRect(x: 0, y:View1.frame.size.height * 2/8, width: View1.frame.size.width/2, height: View1.frame.size.height/8)
//        iRect3 = CGRect(x: 0, y: View1.frame.size.height * 3/8, width: View1.frame.size.width/2, height: View1.frame.size.height/8)
//        iRect4 = CGRect(x: 0, y: View1.frame.size.height * 4/8, width: View1.frame.size.width/2, height: View1.frame.size.height/8)
//        iRect5 = CGRect(x: 0, y: View1.frame.size.height * 5/8, width: View1.frame.size.width/2, height: View1.frame.size.height/8)
//        
//        HisyoRect = CGRect(x: View1.frame.size.width*1.3/2, y: View1.frame.size.height*6/8, width: View1.frame.size.width/2, height: View1.frame.size.height*1.5/8)
//        HukidashiRect = CGRect(x: 0, y: View1.frame.size.height*5.5/8, width: View1.frame.size.width*4/5, height: View1.frame.size.height*2.8/8)
//        CommentRect = CGRect(x: 50, y: View1.frame.size.height*5.5/8, width: View1.frame.size.width*4/5, height: View1.frame.size.height*2.8/8)
//        
//        HusRect = CGRect(x: 0, y: 0, width: View1.frame.size.width/2, height: View1.frame.size.height/8)
//        WifeRect = CGRect(x: View1.frame.size.width/2, y: 0, width: View1.frame.size.width/2, height: View1.frame.size.height/8)
//
//        
//        firstView.image = image1
//        firstView.frame = Rect1
//        secondView.image = image2
//        secondView.frame = Rect2
//        thirdView.image = image3
//        thirdView.frame = Rect3
//        fourthView.image = image4
//        fourthView.frame = Rect4
//        fifthView.image = image5
//        fifthView.frame = Rect5
//        
//        firstImage.image = image1
//        firstImage.frame = iRect1
//        secondImage.image = image2
//        secondImage.frame = iRect2
//        thirdImage.image = image3
//        thirdImage.frame = iRect3
//        fourthImage.image = image4
//        fourthImage.frame = iRect4
//        fifthImage.image = image5
//        fifthImage.frame = iRect5
//        
//        Hisyo.image =  imageHisyo
//        Hisyo.frame = HisyoRect
//        Hukidashi.image = imageHukidashi
//        Hukidashi.frame = HukidashiRect
//        
//        hus_theme.image =  Hustheme
//        hus_theme.frame = HusRect
//        wife_theme.image = Wifetheme
//        wife_theme.frame = WifeRect
//        
//        comment.frame = CommentRect
//    }
//    
//    
//    func imageChange1() {
//        self.firstImage.image = image1
//    }
//    func ViewChange1() {
//        self.firstView.image = image1
//    }
//    
//    func imageChange2() {
//        self.secondImage.image = image2
//    }
//    func ViewChange2() {
//        self.secondView.image = image2
//    }
//    
//    func imageChange3() {
//        self.thirdImage.image = image3
//    }
//    func ViewChange3() {
//        self.thirdView.image = image3
//    }
//    
//    func imageChange4() {
//        self.fourthImage.image = image4
//    }
//    func ViewChange4() {
//        self.fourthView.image = image4
//    }
//    
//    func imageChange5() {
//        self.fifthImage.image = image5
//    }
//    func ViewChange5() {
//        self.fifthView.image = image5
//    }
//
//    func imageChange11() {
//        self.firstImage.image = image11
//    }
//    
//    func imageChange12() {
//        self.firstView.image = image12
//    }
//    
//    func imageChange21() {
//        self.secondImage.image = image21
//    }
//    
//    func imageChange22() {
//        self.secondView.image = image22
//    }
//    
//    func imageChange31() {
//        self.thirdImage.image = image31
//    }
//    
//    func imageChange32() {
//        self.thirdView.image = image32
//    }
//    
//    func imageChange41() {
//        self.fourthImage.image = image41
//    }
//    
//    func imageChange42() {
//        self.fourthView.image = image42
//    }
//    
//    func imageChange51() {
//        self.fifthImage.image = image51
//    }
//    
//    func imageChange52() {
//        self.fifthView.image = image52
//    }
//    
//    func PlaySound(name: String) {
//        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
//            print("音源ファイルが見つかりません")
//            return
//        }
//        
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
//            
//            audioPlayer.delegate = self
//            
//            audioPlayer.play()
//        } catch {
//        }
//    }
//    
//
//    
////    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
////        for obj in touches {
////            let touch = obj
////            let location = touch.location(in: self.View1)
////            
////            if location.x < View1.frame.size.width/2 {
////                if location.y < View1.frame.size.height/5 {
////                    if count1 == 0 {
////                        firstImage.image = image11
////                        count1 = 1
////                    } else {
////                        firstImage.image = image1
////                        count1 = 0
////                    }
////                } else if location.y < View1.frame.size.height*2/5 {
////                    if count2 == 0 {
////                        secondImage.image = image21
////                        count2 = 1
////                    } else {
////                        secondImage.image = image2
////                        count2 = 0
////                    }
////                } else if location.y < View1.frame.size.height*3/5 {
////                    if count3 == 0 {
////                        thirdImage.image = image31
////                        count3 = 1
////                    } else {
////                        thirdImage.image = image3
////                        count3 = 0
////                    }
////                } else if location.y < View1.frame.size.height*4/5 {
////                    if count4 == 0 {
////                        fourthImage.image = image41
////                        count4 = 1
////                    } else {
////                        fourthImage.image = image4
////                        count4 = 0
////                    }
////                } else if location.y < View1.frame.size.height {
////                    if count5 == 0 {
////                        fifthImage.image = image51
////                        count5 = 1
////                    } else {
////                        fifthImage.image = image5
////                        count5 = 0
////                    }
////                    
////                }
////            }
////
////            if location.x > View1.frame.size.width/2 {
////                if location.y < View1.frame.size.height/5 {
////                    if icount1 == 0 {
////                        firstView.image = image12
////                        icount1 = 1
////                    } else {
////                        firstView.image = image1
////                        icount1 = 0
////                    }
////                } else if location.y < View1.frame.size.height*2/5 {
////                    if icount2 == 0 {
////                        secondView.image = image22
////                        icount2 = 1
////                    } else {
////                        secondView.image = image2
////                        icount2 = 0
////                    }
////                } else if location.y < View1.frame.size.height*3/5 {
////                    if icount3 == 0 {
////                        thirdView.image = image32
////                        icount3 = 1
////                    } else {
////                        thirdView.image = image3
////                        icount3 = 0
////                    }
////                } else if location.y < View1.frame.size.height*4/5 {
////                    if icount4 == 0 {
////                        fourthView.image = image42
////                        icount4 = 1
////                    } else {
////                        fourthView.image = image4
////                        icount4 = 0
////                    }
////                } else if location.y < View1.frame.size.height {
////                    if icount5 == 0 {
////                        fifthView.image = image52
////                        icount5 = 1
////                    } else {
////                        fifthView.image = image5
////                        icount5 = 0
////                    }
////                    
////                }
////            }
////
////        }
////    }
//    
//    var user = ""
//    var password = ""
//    var database = ""
//    var measurement = ""
//    var ssl = false
//    var host = ""
//    var port = 0
//    let unit = "s"
//    
//    
//    /// KeyChainとUserDefaultsに保存されているパラメータを読み込む
//    func paramLoad() {
//        user = Keychain.user.value()!
//        password = Keychain.password.value()!
//        database = UserDefaults.standard.string(forKey: Config.database)!
//        measurement = UserDefaults.standard.string(forKey: Config.measurement)!
//        ssl = UserDefaults.standard.bool(forKey: Config.ssl)
//        host = UserDefaults.standard.string(forKey: Config.host)!
//        port = UserDefaults.standard.integer(forKey: Config.port)
//    }
//    
//    var a = 0
//    @objc func HisyoComment() {
//        Hisyo.image = UIImage(named: "Hisho_hutuu")
//        self.comment.text = " "
//    }
//    
//    
//    /// DBからラベルデータを取得する
//    ///
//    /// - Parameters:
//    ///   - handler: 送信結果を返却する
//    @objc func Select() {
//         paramLoad()
//         
//         var list = [[String: Any]]()
//         let query = "SELECT * FROM \(measurement)"
//         let influxdb = InfluxDBClient(host: host, port: port, user: user, password: password, ssl: ssl)
//         let request = QueryRequest(influxdb: influxdb, query: query, database: database, epoch: unit)
//         
//         Session.send(request) { result in
//             switch result {
//             case let .success(.results(value)):
//                
//                 if let results = value.results {
//                     for result in results {
//                         if let series = result.series {
//                             for s in series {
//                                 for v in s.values {
//                                     list.append(zip(s.columns, v).reduce(into: [String: Any]()) { $0[$1.0] = $1.1 })
//                                 }
//                             }
//                         }
//                     }
//                 }
////                 print(list.last!["pir"]!, list.last!["eep"]!)
//                 
//                 //listの最後と最後から2番目の要素のactivityとstatusをInt型にして取り出す
//                 
//                 let listCount = list.count
//                 let preActiveNum = list[listCount-2]["pir"] as? StringOrIntType
//                 let preActiveAct = list[listCount-2]["eep"] as? StringOrIntType
//                 let ActiveNum = list.last!["pir"]! as? StringOrIntType
//                 let ActiveAct = list.last!["eep"]! as? StringOrIntType
//                 let ActiveStr = ActiveNum?.string()
//                 let ActiveActStr = ActiveAct?.string()
//                 let genActiveActStr = ActiveActStr![(ActiveActStr?.index(ActiveActStr!.startIndex, offsetBy: 3)...)!]
//                 var preActiveStr = preActiveNum?.string()
//                 let preActiveActStr = preActiveAct?.string()
//                 self.comment.font = UIFont(name: "Hiragino Maru Gothic ProN", size: 25)
//                
//                print(ActiveActStr, ActiveStr)
//                 //行動状態によって表示する画像を変化
//                 if ActiveStr == "1" {
//                    if genActiveActStr == "00-01" && self.hus_bathing_count == 0{
//                        self.imageChange11()
//                        self.PlaySound(name: "bathingstart ")
//                        self.hus_bathing_count = 1
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "今から、お風呂に入るんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "01-01" && self.hus_cooking_count == 0{
//                        self.imageChange21()
//                        self.PlaySound(name: "cookingstart")
//                        self.hus_cooking_count = 1
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "今から、お料理をするんですね♪"
//                        self.self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "02-01" && self.hus_eating_count == 0{
//                        self.imageChange31()
//                        self.PlaySound(name: "eatingstart")
//                        self.hus_eating_count = 1
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "今から、お食事をするんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "03-01" && self.hus_going_count == 0{
//                        self.imageChange41()
//                        self.PlaySound(name: "goingoutstart")
//                        self.hus_going_count = 1
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "今から、お出かけをするんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "04-01" && self.hus_sleeping_count == 0{
//                        self.imageChange51()
//                        self.PlaySound(name: "sleepingstart")
//                        self.hus_sleeping_count = 1
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "今から、寝るんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "00-02" && self.wife_bathing_count == 0{
//                        self.imageChange12()
//                        self.PlaySound(name: "bathingstart ")
//                        self.wife_bathing_count = 1
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "今から、お風呂に入るんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "01-02" && self.wife_cooking_count == 0{
//                        self.imageChange22()
//                        self.PlaySound(name: "cookingstart")
//                        self.wife_cooking_count = 1
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "今から、お料理をするんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "02-02" && self.wife_eating_count == 0{
//                        self.imageChange32()
//                        self.PlaySound(name: "eatingstart")
//                        self.wife_eating_count = 1
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "今から、お食事をするんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "03-02" && self.wife_going_count == 0{
//                        self.imageChange42()
//                        self.PlaySound(name: "goingoutstart")
//                        self.wife_going_count = 1
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "今から、お出かけをするんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "04-02" && self.wife_sleeping_count == 0{
//                        self.imageChange52()
//                        self.PlaySound(name: "sleepingstart")
//                        self.wife_sleeping_count = 1
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "今から、寝るんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    
//                 } else if ActiveStr == "0" {
//                    if genActiveActStr == "00-01" && self.hus_bathing_count == 1{
//                        self.imageChange1()
//                        self.PlaySound(name: "bathingend ")
//                        self.hus_bathing_count = 0
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "お風呂から上がったんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "01-01" && self.hus_cooking_count == 1{
//                        self.imageChange2()
//                        self.PlaySound(name: "cookingend")
//                        self.hus_cooking_count = 0
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "お料理を終わるんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "02-01" && self.hus_eating_count == 1{
//                        self.imageChange3()
//                        self.PlaySound(name: "eatingend")
//                        self.hus_eating_count = 0
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "お食事を終わるんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//
//                    }
//                    else if genActiveActStr == "03-01" && self.hus_going_count == 1{
//                        self.imageChange4()
//                        self.PlaySound(name: "goingoutend")
//                        self.hus_going_count = 0
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "お出かけから帰ってきたんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//
//                    }
//                    else if genActiveActStr == "04-01" && self.hus_sleeping_count == 1{
//                        self.imageChange5()
//                        self.PlaySound(name: "sleepingend")
//                        self.hus_sleeping_count = 0
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "起きたんですね！おはようございます♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//
//                    }
//                    else if genActiveActStr == "00-02" && self.wife_bathing_count == 1 {
//                        self.ViewChange1()
//                        self.PlaySound(name: "bathingend ")
//                        self.wife_bathing_count = 0
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "お風呂から上がったんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "01-02" && self.wife_cooking_count == 1{
//                        self.ViewChange2()
//                        self.PlaySound(name: "cookingend")
//                        self.wife_cooking_count = 0
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "お料理を終わるんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "02-02" && self.wife_eating_count == 1{
//                        self.ViewChange3()
//                        self.PlaySound(name: "eatingend")
//                        self.wife_eating_count = 0
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "お食事を終わるんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "03-02" && self.wife_going_count == 1{
//                        self.ViewChange4()
//                        self.PlaySound(name: "goingoutend")
//                        self.wife_going_count = 0
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "お出かけから帰ってきたんですね♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                    else if genActiveActStr == "04-02" && self.wife_sleeping_count == 1{
//                        self.ViewChange5()
//                        self.PlaySound(name: "sleepingend")
//                        self.wife_sleeping_count = 0
//                        self.Hisyo.image = UIImage(named: "Hisho_warai")
//                        self.comment.text = "起きたんですね！おはようございます♪"
//                        self.timer2?.invalidate()
//                        self.timer2 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.HisyoComment), userInfo: nil, repeats: true)
//                    }
//                 }
//             
//             case .success(.noContent):
//                 print("noContent")
//             
//             case .success(.unknown(_)):
//                 print("unknown")
//             
//             case .failure(let error):
//                print(query)
//                 print("error")
//             }
//         }
//     }
//    
//    
//}


