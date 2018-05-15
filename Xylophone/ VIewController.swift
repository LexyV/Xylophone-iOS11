
//always necessary
import UIKit;

//Step 1
//audio visual foundation *works with the longer version of code*
import AVFoundation;

//Step 2 - add (,AVAudioPlayerDelegate
class ViewController: UIViewController, AVAudioPlayerDelegate {

    //Step 3 - create variable w/ type av audio player w/ !
    var audioPlayer: AVAudioPlayer!;
    
    //make global variable
    var selectedSoundFileName : String = "";
    
    //create array of all the sounds (.wav not necessary)
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"];
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }

    @IBAction func notePressed(_ sender: UIButton) {
        //used to pick out exact note to sound play *use - 1 so you don't get out of range error*
        selectedSoundFileName = soundArray[sender.tag - 1];
        
        playSound();
    }
    
    func playSound() {
        
        //Step 4 - create url for when sound pressed
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        
        }
}



//works with the shorter version of code
//import AudioToolbox;

//search stack overflow for (create and play sound in swift3) look for ones w green answers
//Or search forums.developer.apple.com

//shorter more updated version of code
//        if let soundURL = Bundle.main.url(forResource: "note1", withExtension: "wav") {
//            var mySound: SystemSoundID = 0
//            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
//            //Play
//            AudioServicesPlaySystemSound(mySound);
//        }

