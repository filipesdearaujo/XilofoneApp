import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    @IBAction func keyPressed(_ sender: UIButton) {
        //O ponto de exclamação abaixo serve para informar "Nao se preocupe, todos os botoes tem label". Pois se caso o botão não tivesse label, como ele iria enviar o argumento para a funcão ser executada
        playSound(soundName: sender.currentTitle!)
        sender.alpha = 0.5
          //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
