//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by Sarim Khan on 27/01/2020.
//  Copyright © 2020 Sarim Khan. All rights reserved.
//

import UIKit

class PlaySoundViewController: UIViewController {
    
    var recordedUrl:URL!
    
    @IBOutlet weak var fastButton:UIButton!
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
