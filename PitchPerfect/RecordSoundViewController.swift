//
//  RecordSoundViewController.swift
//  PitchPerfect
//
//  Created by Sarim Khan on 24/01/2020.
//  Copyright © 2020 Sarim Khan. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder:AVAudioRecorder!
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appers")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("View did appear")
        stopButton.isEnabled=false
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        // Do any additional setup after loading the view.
    }

    @IBAction func recordAudio(_ sender: Any) {
        recordingLabel.text="Audio Recording"
        recordButton.isEnabled=false
        stopButton.isEnabled=true
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        //print(filePath?.absoluteString)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate=self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    
    @IBAction func stopAudio(_ sender: Any) {
        recordingLabel.text="Audio Stop Recording"
        recordButton.isEnabled=true
        stopButton.isEnabled=false
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        
        if flag{
                performSegue(withIdentifier: "stopRecord", sender: audioRecorder.url)
        }else{
            print("Recording fail")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="stopRecord"{
            let playSoundVC=segue.destination as! PlaySoundViewController
            let recordAudioURL=sender as! URL
            playSoundVC.recordedUrl=recordAudioURL
        }
    }
    
}

