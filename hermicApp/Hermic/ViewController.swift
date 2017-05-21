//
//  ViewController.swift
//  Hermic
//
//  Created by Harit on 1/24/2560 BE.
//  Copyright © 2560 Hermic. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    @IBOutlet weak var PlayBTN: UIButton!
    @IBOutlet weak var RecordBTN: UIButton!
    @IBOutlet weak var RecordBinary: UILabel!
    
    var soundRecorder : AVAudioRecorder!
    var soundPlayer : AVAudioPlayer!
    var fileName = "audioFile.m4a"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //soundRecorder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*func setupRecorderOld() {
        let recordSettings = [AVFormatIDKey : Int(kAudioFormatAppleLossless), AVSampleRateKey : 44100, AVNumberOfChannelsKey : 2, AVEncoderAudioQualityKey : AVAudioQuality.high.rawValue]
        
        //
        do {
            try soundRecorder = AVAudioRecorder(url: getFileURL() as URL, settings: recordSettings)
        } catch {
            
        }
    }*/
    
    func getCacheDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        return paths[0]
    }
    
    func getFileURL() -> NSURL {
        let path = getCacheDirectory().appending(fileName)
        //let path = getCacheDirectory().stringByAppendingPathComponent(fileName)
        let filePath = NSURL(fileURLWithPath: path)
        //return filePath
        return filePath
    }

    //test
    /*func setupRecorder() {
        //let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        
        let settings = [AVFormatIDKey : Int(kAudioFormatAppleLossless), AVSampleRateKey : 44100, AVNumberOfChannelsKey : 2, AVEncoderAudioQualityKey : AVAudioQuality.high.rawValue]
        
        do {
            soundRecorder = try AVAudioRecorder(url: getFileURL() as URL, settings: settings)
            soundRecorder.delegate = self
            //soundRecorder.record()
            
        } catch {
            print(error)
        }
    }*/
    func startRecording() {
        let audioFilename = getFileURL()
        
        /*let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]*/
        
        let settings = [AVFormatIDKey : Int(kAudioFormatAppleLossless), AVSampleRateKey : 44100, AVNumberOfChannelsKey : 2, AVEncoderAudioQualityKey : AVAudioQuality.high.rawValue]
        
        do {
            soundRecorder = try AVAudioRecorder(url: audioFilename as URL, settings: settings)
            soundRecorder.delegate = self
            soundRecorder.record()
            
            //recordButton.setTitle("Tap to Stop", for: .normal)
        } catch {
            //finishRecording(success: false)
        }
    }
    
    @IBAction func Record(_ sender: UIButton) {
        if sender.titleLabel?.text == "Record" {
            //soundRecorder.record()
            startRecording()
            sender.setTitle("Stop", for: .normal)
            PlayBTN.isEnabled = false
        }
        else {
            soundRecorder.stop()
            sender.setTitle("Record", for: .normal)
            PlayBTN.isEnabled = false
        }
    }

    @IBAction func PlaySound(_ sender: UIButton) {
        if sender.titleLabel?.text == "Play" {
            
            RecordBTN.isEnabled = false
            sender.setTitle("Stop", for: .normal)
            
            preparePlayer()
            soundPlayer.play()
        }
        else {
            soundPlayer.stop()
            sender.setTitle("Play", for: .normal)
        }
    }
    
    func preparePlayer() {
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: getFileURL() as URL)
        }
        catch {
            
        }
        soundPlayer.delegate = self
        soundPlayer.prepareToPlay()
        soundPlayer.volume = 1.0
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        PlayBTN.isEnabled = true
        RecordBTN.setTitle("Record", for: .normal)
    }
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        RecordBTN.isEnabled = true
        PlayBTN.setTitle("Play", for: .normal)
    }
}

