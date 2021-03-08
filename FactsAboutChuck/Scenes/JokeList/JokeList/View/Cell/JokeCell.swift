//
//  JokeCell.swift
//  FactsAboutChuck
//
//  Created by Daniel Cech on 08/03/2021.
//  Copyright © 2021 STRV. All rights reserved.
//

import RxDataSources
import UIKit

class JokeCell: UITableViewCell, NibLoadableView {
    @IBOutlet private var numberLabel: UILabel!
    @IBOutlet private var jokeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(with joke: Joke) {
        numberLabel.text = String(joke.id)
        jokeLabel.text = joke.joke
    }
}
