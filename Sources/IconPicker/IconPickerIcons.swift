//
//  Icons.swift
//  PPL
//
//  Created by Michal Jendrzejewski on 28/06/2021.
//

import Foundation
import SwiftUI


let symbols : [String: [String]] = [
//        "Communication": ["mic","mic.fill","mic.circle","mic.circle.fill","mic.slash","mic.slash.fill","bubble.right","bubble.right.fill","bubble.left","bubble.left.fill","exclamationmark.bubble","exclamationmark.bubble.fill","quote.bubble","quote.bubble.fill","t.bubble","t.bubble.fill","text.bubble","text.bubble.fill","captions.bubble","captions.bubble.fill","plus.bubble","plus.bubble.fill","rectangle.3.offgrid.bubble.left","rectangle.3.offgrid.bubble.left.fill","ellipsis.bubble","ellipsis.bubble.fill","phone.bubble.left","phone.bubble.left.fill","bubble.middle.bottom","bubble.middle.bottom.fill","bubble.middle.top","bubble.middle.top.fill","bubble.left.and.bubble.right","bubble.left.and.bubble.right.fill","phone","phone.fill","phone.circle","phone.circle.fill","phone.badge.plus","phone.fill.badge.plus","phone.connection","phone.fill.connection","phone.arrow.up.right","phone.fill.arrow.up.right","phone.arrow.down.left","phone.fill.arrow.down.left","phone.arrow.right","phone.fill.arrow.right","phone.down","phone.down.fill","phone.down.circle","phone.down.circle.fill","envelope","envelope.fill","envelope.circle","envelope.circle.fill","envelope.arrow.triangle.branch","envelope.arrow.triangle.branch.fill","envelope.open","envelope.open.fill","envelope.badge","envelope.badge.fill","waveform","waveform.circle","waveform.circle.fill"],
//        "Weather": ["sun.min","sun.min.fill","sun.max","sun.max.fill","sunrise","sunrise.fill","sunset","sunset.fill","sun.dust","sun.dust.fill","sun.haze","sun.haze.fill","moon","moon.fill","moon.circle","moon.circle.fill","sparkles","moon.stars","moon.stars.fill","cloud","cloud.fill","cloud.drizzle","cloud.drizzle.fill","cloud.rain","cloud.rain.fill","cloud.heavyrain","cloud.heavyrain.fill","cloud.fog","cloud.fog.fill","cloud.hail","cloud.hail.fill","cloud.snow","cloud.snow.fill","cloud.sleet","cloud.sleet.fill","cloud.bolt","cloud.bolt.fill","cloud.bolt.rain","cloud.bolt.rain.fill","cloud.sun","cloud.sun.fill","cloud.sun.rain","cloud.sun.rain.fill","cloud.sun.bolt","cloud.sun.bolt.fill","cloud.moon","cloud.moon.fill","cloud.moon.rain","cloud.moon.rain.fill","cloud.moon.bolt","cloud.moon.bolt.fill","smoke","smoke.fill","wind","wind.snow","snow","tornado","tropicalstorm","hurricane","thermometer.sun","thermometer.sun.fill","thermometer.snowflake","thermometer","aqi.low","aqi.medium","aqi.high"],
    "Devices": [
        "keyboard","keyboard.chevron.compact.down","keyboard.chevron.compact.left","keyboard.onehanded.left","keyboard.onehanded.right","printer","printer.fill","printer.fill.and.paper.fill","printer.dotmatrix","printer.dotmatrix.fill","printer.dotmatrix.fill.and.paper.fill","scanner","scanner.fill","faxmachine","tv","tv.fill","tv.circle","tv.circle.fill","4k.tv","4k.tv.fill","tv.music.note","tv.music.note.fill","play.tv","play.tv.fill","photo.tv","tv.and.hifispeaker.fill","tv.and.mediabox","display","display.trianglebadge.exclamationmark","display.2","desktopcomputer","pc","server.rack","laptopcomputer","arrow.turn.up.forward.iphone","arrow.turn.up.forward.iphone.fill","apps.iphone","apps.iphone.badge.plus","apps.iphone.landscape","apps.ipad","apps.ipad.landscape","hifispeaker","hifispeaker.fill","hifispeaker.2","hifispeaker.2.fill","gamecontroller","gamecontroller.fill","hearingaid.ear","headphones","headphones.circle","headphones.circle.fill", "number"
    ],
//        "Games": [
//            "circle.grid.cross","circle.grid.cross.fill","circle.grid.cross.left.fill","circle.grid.cross.up.fill","circle.grid.cross.right.fill","circle.grid.cross.down.fill","circle.square","circle.fill.square.fill","house","house.fill","house.circle","house.circle.fill","rectangle.on.rectangle","rectangle.fill.on.rectangle.fill","rectangle.fill.on.rectangle.fill.circle","rectangle.fill.on.rectangle.fill.circle.fill","gamecontroller","gamecontroller.fill","l.joystick","l.joystick.fill","r.joystick","r.joystick.fill","l.joystick.down","l.joystick.down.fill","r.joystick.down","r.joystick.down.fill","dpad","dpad.fill","dpad.left.fill","dpad.up.fill","dpad.right.fill","dpad.down.fill","circle.circle","circle.circle.fill","square.circle","square.circle.fill","triangle.circle","triangle.circle.fill","rectangle.roundedtop","rectangle.roundedtop.fill","rectangle.roundedbottom","rectangle.roundedbottom.fill","l.rectangle.roundedbottom","l.rectangle.roundedbottom.fill","l1.rectangle.roundedbottom","l1.rectangle.roundedbottom.fill","l2.rectangle.roundedtop","l2.rectangle.roundedtop.fill","r.rectangle.roundedbottom","r.rectangle.roundedbottom.fill","r1.rectangle.roundedbottom","r1.rectangle.roundedbottom.fill","r2.rectangle.roundedtop","r2.rectangle.roundedtop.fill","lb.rectangle.roundedbottom","lb.rectangle.roundedbottom.fill","rb.rectangle.roundedbottom","rb.rectangle.roundedbottom.fill","lt.rectangle.roundedtop","lt.rectangle.roundedtop.fill","rt.rectangle.roundedtop","rt.rectangle.roundedtop.fill","zl.rectangle.roundedtop","zl.rectangle.roundedtop.fill","zr.rectangle.roundedtop","zr.rectangle.roundedtop.fill","line.horizontal.3.circle","line.horizontal.3.circle.fill","plus","plus.circle","plus.circle.fill","minus","minus.circle","minus.circle.fill","xmark","xmark.circle","xmark.circle.fill","arrowtriangle.left.circle","arrowtriangle.left.circle.fill","arrowtriangle.right.circle","arrowtriangle.right.circle.fill","arrowtriangle.up.circle","arrowtriangle.up.circle.fill","arrowtriangle.down.circle","arrowtriangle.down.circle.fill","a.circle","a.circle.fill","b.circle","b.circle.fill","l.circle","l.circle.fill","r.circle","r.circle.fill","x.circle","x.circle.fill","y.circle","y.circle.fill"],
    "Connectivity": [
        "externaldrive.connected.to.line.below","externaldrive.connected.to.line.below.fill","personalhotspot","network","bolt.horizontal","bolt.horizontal.fill","bolt.horizontal.circle","bolt.horizontal.circle.fill","wifi","wifi.slash","wifi.exclamationmark","dot.radiowaves.left.and.right","dot.radiowaves.right","dot.radiowaves.forward","wave.3.left","wave.3.left.circle","wave.3.left.circle.fill","wave.3.backward","wave.3.backward.circle","wave.3.backward.circle.fill","wave.3.right","wave.3.right.circle","wave.3.right.circle.fill","wave.3.forward","wave.3.forward.circle","wave.3.forward.circle.fill","antenna.radiowaves.left.and.right",
    ],
//        "Transports": [
//            "externaldrive.connected.to.line.below","externaldrive.connected.to.line.below.fill","personalhotspot","network","bolt.horizontal","bolt.horizontal.fill","bolt.horizontal.circle","bolt.horizontal.circle.fill","wifi","wifi.slash","wifi.exclamationmark","dot.radiowaves.left.and.right","dot.radiowaves.right","dot.radiowaves.forward","wave.3.left","wave.3.left.circle","wave.3.left.circle.fill","wave.3.backward","wave.3.backward.circle","wave.3.backward.circle.fill","wave.3.right","wave.3.right.circle","wave.3.right.circle.fill","wave.3.forward","wave.3.forward.circle","wave.3.forward.circle.fill","antenna.radiowaves.left.and.right"
//        ],
    "People": [
        "folder.badge.person.crop","folder.fill.badge.person.crop","externaldrive.badge.person.crop","externaldrive.fill.badge.person.crop","person","person.fill","person.fill.turn.right","person.fill.turn.down","person.fill.turn.left","person.fill.checkmark","person.fill.xmark","person.fill.questionmark","person.circle","person.circle.fill","person.badge.plus","person.fill.badge.plus","person.badge.minus","person.fill.badge.minus","person.and.arrow.left.and.arrow.right","person.fill.and.arrow.left.and.arrow.right","person.2","person.2.fill","person.2.circle","person.2.circle.fill","person.3","person.3.fill","person.crop.circle","person.crop.circle.fill","person.crop.circle.badge.plus","person.crop.circle.fill.badge.plus","person.crop.circle.badge.minus","person.crop.circle.fill.badge.minus","person.crop.circle.badge.checkmark","person.crop.circle.fill.badge.checkmark","person.crop.circle.badge.xmark","person.crop.circle.fill.badge.xmark","person.crop.circle.badge.questionmark","person.crop.circle.fill.badge.questionmark","person.crop.circle.badge.exclamationmark","person.crop.circle.fill.badge.exclamationmark","person.crop.square","person.crop.square.fill","rectangle.stack.person.crop","rectangle.stack.person.crop.fill","person.2.square.stack","person.2.square.stack.fill","person.crop.square.fill.and.at.rectangle","eye","eye.fill","eye.circle","eye.circle.fill","eye.slash","eye.slash.fill","eyes","eyes.inverse","eyebrow","nose","nose.fill","mustache","mustache.fill","mouth","mouth.fill","lungs","lungs.fill","face.smiling","face.smiling.fill","face.dashed","face.dashed.fill","person.fill.viewfinder","person.crop.rectangle","person.crop.rectangle.fill","arrow.up.and.person.rectangle.portrait","arrow.up.and.person.rectangle.turn.right","arrow.up.and.person.rectangle.turn.left","rectangle.badge.person.crop","rectangle.fill.badge.person.crop","rectangle.stack.badge.person.crop","rectangle.stack.fill.badge.person.crop","figure.walk","figure.walk.circle","figure.walk.circle.fill","figure.walk.diamond","figure.walk.diamond.fill","figure.stand","figure.stand.line.dotted.figure.stand","figure.wave","figure.wave.circle","figure.wave.circle.fill","ear","ear.badge.checkmark","ear.trianglebadge.exclamationmark","ear.fill","hearingaid.ear","hand.raised","hand.raised.fill","hand.raised.slash","hand.raised.slash.fill","hand.thumbsup","hand.thumbsup.fill","hand.thumbsdown","hand.thumbsdown.fill","hand.point.up.left","hand.point.up.left.fill","hand.draw","hand.draw.fill","hand.tap","hand.tap.fill","hand.point.left","hand.point.left.fill","hand.point.right","hand.point.right.fill","hand.point.up","hand.point.up.fill","hand.point.up.braille","hand.point.up.braille.fill","hand.point.down","hand.point.down.fill","hand.wave","hand.wave.fill","hands.clap","hands.clap.fill","hands.sparkles","hands.sparkles.fill"
    ],
    "Nature": [
        "flame","flame.fill","drop","drop.fill","drop.triangle","drop.triangle.fill","bolt","bolt.fill","bolt.circle","bolt.circle.fill","bolt.slash","bolt.slash.fill","bolt.slash.circle","bolt.slash.circle.fill","hare","hare.fill","tortoise","tortoise.fill","ant","ant.fill","ant.circle","ant.circle.fill","ladybug","ladybug.fill","leaf","leaf.fill","leaf.arrow.triangle.circlepath"
    ],
//        "Edit": [
//            "pencil","pencil.circle","pencil.circle.fill","pencil.slash","square.and.pencil","rectangle.and.pencil.and.ellipsis","scribble","scribble.variable","highlighter","pencil.and.outline","lasso","lasso.sparkles","loupe","circle.lefthalf.fill","circle.righthalf.fill","circle.dashed","square.dashed","eye.slash","eye.slash.fill","signature","scissors","scissors.badge.ellipsis","wand.and.rays","wand.and.rays.inverse","wand.and.stars","wand.and.stars.inverse","crop","crop.rotate","dial.min","dial.min.fill","dial.max","dial.max.fill","paintbrush","paintbrush.fill","paintbrush.pointed","paintbrush.pointed.fill","bandage","bandage.fill","eyedropper","eyedropper.halffull","eyedropper.full","move.3d","scale.3d","rotate.3d","rotate.left","rotate.left.fill","rotate.right","rotate.right.fill","selection.pin.in.out","timeline.selection","rectangle.dashed","rectangle.dashed.badge.record","slider.horizontal.3","slider.horizontal.below.rectangle","slider.horizontal.below.square.fill.and.square","slider.vertical.3","perspective","aspectratio","aspectratio.fill","camera.filters","skew","arrow.left.and.right.righttriangle.left.righttriangle.right","arrow.left.and.right.righttriangle.left.righttriangle.right.fill","arrow.up.and.down.righttriangle.up.righttriangle.down","arrow.up.and.down.righttriangle.up.fill.righttriangle.down.fill"
//        ],
//        "Text": [
//            "paragraphsign","list.dash","list.bullet","list.triangle","list.bullet.indent","list.number","list.star","increase.indent","decrease.indent","decrease.quotelevel","increase.quotelevel","text.alignleft","text.aligncenter","text.alignright","text.justify","text.justifyleft","text.justifyright","text.redaction","character","abc","textformat.alt","textformat","textformat.size","textformat.superscript","textformat.subscript","bold","italic","underline","strikethrough","shadow","bold.italic.underline","bold.underline","text.cursor","textformat.abc","textformat.abc.dottedunderline","textformat.123","textbox","a.magnify"
//        ],
    "Multimedia":[
        "play","play.fill","play.circle","play.circle.fill","play.rectangle","play.rectangle.fill","play.slash","play.slash.fill","pause","pause.fill","pause.circle","pause.circle.fill","pause.rectangle","pause.rectangle.fill","stop","stop.fill","stop.circle","stop.circle.fill","record.circle","record.circle.fill","playpause","playpause.fill","backward","backward.fill","forward","forward.fill","backward.end","backward.end.fill","forward.end","forward.end.fill","backward.end.alt","backward.end.alt.fill","forward.end.alt","forward.end.alt.fill","backward.frame","backward.frame.fill","forward.frame","forward.frame.fill","shuffle","shuffle.circle","shuffle.circle.fill","repeat","repeat.circle","repeat.circle.fill","repeat.1","repeat.1.circle","repeat.1.circle.fill","infinity","infinity.circle","infinity.circle.fill","arrow.rectanglepath","goforward","gobackward","goforward.10","gobackward.10","goforward.15","gobackward.15","goforward.30","gobackward.30","goforward.45","gobackward.45","goforward.60","gobackward.60","goforward.75","gobackward.75","goforward.90","gobackward.90","goforward.plus","gobackward.minus"
    ],
//        "KeyBoard":[
//            "command","command.circle","command.circle.fill","command.square","command.square.fill","option","alt","delete.right","delete.right.fill","clear","clear.fill","delete.left","delete.left.fill","shift","shift.fill","capslock","capslock.fill","escape","power","globe","sun.min","sun.min.fill","sun.max","sun.max.fill","light.min","light.max","keyboard","keyboard.chevron.compact.down","keyboard.chevron.compact.left","keyboard.onehanded.left","keyboard.onehanded.right","eject","eject.fill","eject.circle","eject.circle.fill","mount","mount.fill","control","projective","arrow.left.to.line.alt","arrow.left.to.line","arrow.right.to.line.alt","arrow.right.to.line","arrow.up.to.line.alt","arrow.up.to.line","arrow.down.to.line.alt","arrow.down.to.line"
//        ],
//        "Commerce": [
//            "signature","bag","bag.fill","bag.circle","bag.circle.fill","bag.badge.plus","bag.fill.badge.plus","bag.badge.minus","bag.fill.badge.minus","cart","cart.fill","cart.circle","cart.circle.fill","cart.badge.plus","cart.fill.badge.plus","cart.badge.minus","cart.fill.badge.minus","creditcard","creditcard.fill","creditcard.circle","creditcard.circle.fill","giftcard","giftcard.fill","banknote","banknote.fill","dollarsign.circle","dollarsign.circle.fill","dollarsign.square","dollarsign.square.fill","centsign.circle","centsign.circle.fill","centsign.square","centsign.square.fill","yensign.circle","yensign.circle.fill","yensign.square","yensign.square.fill","sterlingsign.circle","sterlingsign.circle.fill","sterlingsign.square","sterlingsign.square.fill","francsign.circle","francsign.circle.fill","francsign.square","francsign.square.fill","florinsign.circle","florinsign.circle.fill","florinsign.square","florinsign.square.fill","turkishlirasign.circle","turkishlirasign.circle.fill","turkishlirasign.square","turkishlirasign.square.fill","rublesign.circle","rublesign.circle.fill","rublesign.square","rublesign.square.fill","eurosign.circle","eurosign.circle.fill","eurosign.square","eurosign.square.fill","dongsign.circle","dongsign.circle.fill","dongsign.square","dongsign.square.fill","indianrupeesign.circle","indianrupeesign.circle.fill","indianrupeesign.square","indianrupeesign.square.fill","tengesign.circle","tengesign.circle.fill","tengesign.square","tengesign.square.fill","pesetasign.circle","pesetasign.circle.fill","pesetasign.square","pesetasign.square.fill","pesosign.circle","pesosign.circle.fill","pesosign.square","pesosign.square.fill","kipsign.circle","kipsign.circle.fill","kipsign.square","kipsign.square.fill","wonsign.circle","wonsign.circle.fill","wonsign.square","wonsign.square.fill","lirasign.circle","lirasign.circle.fill","lirasign.square","lirasign.square.fill","australsign.circle","australsign.circle.fill","australsign.square","australsign.square.fill","hryvniasign.circle","hryvniasign.circle.fill","hryvniasign.square","hryvniasign.square.fill","nairasign.circle","nairasign.circle.fill","nairasign.square","nairasign.square.fill","guaranisign.circle","guaranisign.circle.fill","guaranisign.square","guaranisign.square.fill","coloncurrencysign.circle","coloncurrencysign.circle.fill","coloncurrencysign.square","coloncurrencysign.square.fill","cedisign.circle","cedisign.circle.fill","cedisign.square","cedisign.square.fill","cruzeirosign.circle","cruzeirosign.circle.fill","cruzeirosign.square","cruzeirosign.square.fill","tugriksign.circle","tugriksign.circle.fill","tugriksign.square","tugriksign.square.fill","millsign.circle","millsign.circle.fill","millsign.square","millsign.square.fill","shekelsign.circle","shekelsign.circle.fill","shekelsign.square","shekelsign.square.fill","manatsign.circle","manatsign.circle.fill","manatsign.square","manatsign.square.fill","rupeesign.circle","rupeesign.circle.fill","rupeesign.square","rupeesign.square.fill","bahtsign.circle","bahtsign.circle.fill","bahtsign.square","bahtsign.square.fill","larisign.circle","larisign.circle.fill","larisign.square","larisign.square.fill","bitcoinsign.circle","bitcoinsign.circle.fill","bitcoinsign.square","bitcoinsign.square.fill"
//        ],
    "Time": [
        "clock","clock.fill","deskclock","deskclock.fill","alarm","alarm.fill","stopwatch","stopwatch.fill","timer","timer.square","clock.arrow.circlepath","clock.arrow.2.circlepath","hourglass","hourglass.badge.plus","hourglass.bottomhalf.fill","hourglass.tophalf.fill"
    ],
    "Health": [
        "heart","heart.fill","heart.circle","heart.circle.fill","heart.text.square","heart.text.square.fill","bolt.heart","bolt.heart.fill","bandage","bandage.fill","cross.case","cross.case.fill","bed.double","bed.double.fill","pills","pills.fill","cross","cross.fill","cross.circle","cross.circle.fill","waveform.path.ecg","waveform.path.ecg.rectangle","waveform.path.ecg.rectangle.fill","staroflife","staroflife.fill","staroflife.circle","staroflife.circle.fill"
    ],
//        "Forms": [
//            "seal","seal.fill","circle","circle.fill","capsule","capsule.fill","capsule.portrait","capsule.portrait.fill","oval","oval.fill","oval.portrait","oval.portrait.fill","square","square.fill","app","app.fill","rectangle","rectangle.fill","rectangle.portrait","rectangle.portrait.fill","triangle","triangle.fill","diamond","diamond.fill","octagon","octagon.fill","hexagon","hexagon.fill","rhombus","rhombus.fill","shield","shield.fill","cone","cone.fill","pyramid","pyramid.fill","rectangle.roundedtop","rectangle.roundedtop.fill","rectangle.roundedbottom","rectangle.roundedbottom.fill"
//        ],
//        "Math": [
//            "sum","percent","function","plus","plus.circle","plus.circle.fill","plus.square","plus.square.fill","minus","minus.circle","minus.circle.fill","minus.square","minus.square.fill","plusminus","plusminus.circle","plusminus.circle.fill","plus.slash.minus","minus.slash.plus","multiply","multiply.circle","multiply.circle.fill","multiply.square","multiply.square.fill","divide","divide.circle","divide.circle.fill","divide.square","divide.square.fill","equal","equal.circle","equal.circle.fill","equal.square","equal.square.fill","lessthan","lessthan.circle","lessthan.circle.fill","lessthan.square","lessthan.square.fill","greaterthan","greaterthan.circle","greaterthan.circle.fill","greaterthan.square","greaterthan.square.fill","number","number.circle","number.circle.fill","number.square","number.square.fill","x.squareroot"
//        ],
//        "Objects": [
//            "pencil","pencil.circle","pencil.circle.fill","pencil.slash","square.and.pencil","rectangle.and.pencil.and.ellipsis","highlighter","pencil.and.outline","pencil.tip","pencil.tip.crop.circle","pencil.tip.crop.circle.badge.plus","pencil.tip.crop.circle.badge.minus","pencil.tip.crop.circle.badge.arrow.forward","lasso","lasso.sparkles","trash","trash.fill","trash.circle","trash.circle.fill","trash.slash","trash.slash.fill","folder","folder.fill","folder.circle","folder.circle.fill","folder.badge.plus","folder.fill.badge.plus","folder.badge.minus","folder.fill.badge.minus","folder.badge.questionmark","folder.fill.badge.questionmark","folder.badge.person.crop","folder.fill.badge.person.crop","square.grid.3x1.folder.badge.plus","square.grid.3x1.folder.fill.badge.plus","folder.badge.gear","folder.fill.badge.gear","plus.rectangle.on.folder","plus.rectangle.fill.on.folder.fill","questionmark.folder","questionmark.folder.fill","paperplane","paperplane.fill","paperplane.circle","paperplane.circle.fill","tray","tray.fill","tray.circle","tray.circle.fill","tray.and.arrow.up","tray.and.arrow.up.fill","tray.and.arrow.down","tray.and.arrow.down.fill","tray.2","tray.2.fill","tray.full","tray.full.fill","externaldrive","externaldrive.fill","externaldrive.badge.plus","externaldrive.fill.badge.plus","externaldrive.badge.minus","externaldrive.fill.badge.minus","externaldrive.badge.checkmark","externaldrive.fill.badge.checkmark","externaldrive.badge.xmark","externaldrive.fill.badge.xmark","externaldrive.badge.person.crop","externaldrive.fill.badge.person.crop","externaldrive.badge.icloud","externaldrive.fill.badge.icloud","externaldrive.badge.wifi","externaldrive.fill.badge.wifi","externaldrive.badge.timemachine","externaldrive.fill.badge.timemachine","internaldrive","internaldrive.fill","opticaldiscdrive","opticaldiscdrive.fill","externaldrive.connected.to.line.below","externaldrive.connected.to.line.below.fill","archivebox","archivebox.fill","archivebox.circle","archivebox.circle.fill","xmark.bin","xmark.bin.fill","xmark.bin.circle","xmark.bin.circle.fill","arrow.up.bin","arrow.up.bin.fill","doc","doc.fill","doc.circle","doc.circle.fill","doc.badge.plus","doc.fill.badge.plus","doc.badge.gearshape","doc.badge.gearshape.fill","doc.badge.ellipsis","doc.fill.badge.ellipsis","lock.doc","lock.doc.fill","arrow.up.doc","arrow.up.doc.fill","arrow.down.doc","arrow.down.doc.fill","doc.text","doc.text.fill","doc.on.doc","doc.on.doc.fill","doc.on.clipboard","arrow.right.doc.on.clipboard","arrow.up.doc.on.clipboard","arrow.triangle.2.circlepath.doc.on.clipboard","doc.on.clipboard.fill","doc.text.magnifyingglass","note","note.text","note.text.badge.plus","calendar","calendar.circle","calendar.circle.fill","calendar.badge.plus","calendar.badge.minus","calendar.badge.clock","calendar.badge.exclamationmark","book","book.fill","book.circle","book.circle.fill","newspaper","newspaper.fill","books.vertical","books.vertical.fill","book.closed","book.closed.fill","character.book.closed","character.book.closed.fill","text.book.closed","text.book.closed.fill","greetingcard","greetingcard.fill","bookmark","bookmark.fill","bookmark.circle","bookmark.circle.fill","bookmark.slash","bookmark.slash.fill","rosette","graduationcap","graduationcap.fill","ticket","ticket.fill","paperclip","paperclip.circle","paperclip.circle.fill","paperclip.badge.ellipsis","rectangle.and.paperclip","rectangle.dashed.and.paperclip","link","link.circle","link.circle.fill","link.badge.plus","personalhotspot","umbrella","umbrella.fill","megaphone","megaphone.fill","speaker","speaker.fill","speaker.slash","speaker.slash.fill","speaker.slash.circle","speaker.slash.circle.fill","speaker.zzz","speaker.zzz.fill","speaker.wave.1","speaker.wave.1.fill","speaker.wave.2","speaker.wave.2.fill","speaker.wave.2.circle","speaker.wave.2.circle.fill","speaker.wave.3","speaker.wave.3.fill","music.mic","magnifyingglass","magnifyingglass.circle","magnifyingglass.circle.fill","plus.magnifyingglass","minus.magnifyingglass","1.magnifyingglass","arrow.up.left.and.down.right.magnifyingglass","text.magnifyingglass","flag","flag.fill","flag.circle","flag.circle.fill","flag.slash","flag.slash.fill","flag.slash.circle","flag.slash.circle.fill","flag.badge.ellipsis","flag.badge.ellipsis.fill","bell","bell.fill","bell.circle","bell.circle.fill","bell.slash","bell.slash.fill","bell.slash.circle","bell.slash.circle.fill","bell.badge","bell.badge.fill","tag","tag.fill","tag.circle","tag.circle.fill","tag.slash","tag.slash.fill","flashlight.off.fill","flashlight.on.fill","camera","camera.fill","camera.circle","camera.circle.fill","camera.badge.ellipsis","camera.fill.badge.ellipsis","arrow.triangle.2.circlepath.camera","arrow.triangle.2.circlepath.camera.fill","camera.on.rectangle","camera.on.rectangle.fill","gear","gearshape","gearshape.fill","gearshape.2","gearshape.2.fill","scissors","scissors.badge.ellipsis","wallet.pass","wallet.pass.fill","wand.and.rays","wand.and.rays.inverse","wand.and.stars","wand.and.stars.inverse","crop","crop.rotate","dial.min","dial.min.fill","dial.max","dial.max.fill","gyroscope","gauge","gauge.badge.plus","gauge.badge.minus","speedometer","barometer","metronome","metronome.fill","amplifier","die.face.1","die.face.1.fill","die.face.2","die.face.2.fill","die.face.3","die.face.3.fill","die.face.4","die.face.4.fill","die.face.5","die.face.5.fill","die.face.6","die.face.6.fill","pianokeys","pianokeys.inverse","tuningfork","paintbrush","paintbrush.fill","paintbrush.pointed","paintbrush.pointed.fill","bandage","bandage.fill","ruler","ruler.fill","level","level.fill","wrench","wrench.fill","hammer","hammer.fill","eyedropper","eyedropper.halffull","eyedropper.full","wrench.and.screwdriver","wrench.and.screwdriver.fill","scroll","scroll.fill","stethoscope","printer","printer.fill","printer.fill.and.paper.fill","printer.dotmatrix","printer.dotmatrix.fill","printer.dotmatrix.fill.and.paper.fill","scanner","scanner.fill","faxmachine","briefcase","briefcase.fill","case","case.fill","latch.2.case","latch.2.case.fill","cross.case","cross.case.fill","puzzlepiece","puzzlepiece.fill","lock","lock.fill","lock.circle","lock.circle.fill","lock.square","lock.square.fill","lock.square.stack","lock.square.stack.fill","lock.rectangle","lock.rectangle.fill","lock.rectangle.stack","lock.rectangle.stack.fill","lock.rectangle.on.rectangle","lock.rectangle.on.rectangle.fill","lock.shield","lock.shield.fill","lock.slash","lock.slash.fill","lock.open","lock.open.fill","lock.rotation","lock.rotation.open","key","key.fill","pin","pin.fill","pin.circle","pin.circle.fill","pin.slash","pin.slash.fill","mappin","mappin.circle","mappin.circle.fill","mappin.slash","mappin.and.ellipse","map","map.fill","opticaldisc","radio","radio.fill","antenna.radiowaves.left.and.right","guitars","guitars.fill","bed.double","bed.double.fill","film","film.fill","crown","crown.fill","comb","comb.fill","camera.viewfinder","shield","shield.slash","shield.fill","shield.slash.fill","shield.lefthalf.fill","shield.lefthalf.fill.slash","shield.checkerboard","cube","cube.fill","shippingbox","shippingbox.fill","clock","clock.fill","deskclock","deskclock.fill","alarm","alarm.fill","stopwatch","stopwatch.fill","timer","timer.square","gamecontroller","gamecontroller.fill","paintpalette","paintpalette.fill","simcard","simcard.fill","simcard.2","simcard.2.fill","esim","esim.fill","sdcard","sdcard.fill","scalemass","scalemass.fill","headphones","headphones.circle","headphones.circle.fill","gift","gift.fill","gift.circle","gift.circle.fill","studentdesk","hourglass","hourglass.badge.plus","hourglass.bottomhalf.fill","hourglass.tophalf.fill","camera.filters","lifepreserver","lifepreserver.fill","eyeglasses","binoculars","binoculars.fill","lightbulb","lightbulb.fill","lightbulb.slash","lightbulb.slash.fill","exclamationmark.shield","exclamationmark.shield.fill","xmark.shield","xmark.shield.fill","checkmark.shield","checkmark.shield.fill"],
//        "Arrows": [
//            "arrowshape.turn.up.left","arrowshape.turn.up.left.fill","arrowshape.turn.up.left.circle","arrowshape.turn.up.left.circle.fill","arrowshape.turn.up.backward","arrowshape.turn.up.backward.fill","arrowshape.turn.up.backward.circle","arrowshape.turn.up.backward.circle.fill","arrowshape.turn.up.right","arrowshape.turn.up.right.fill","arrowshape.turn.up.right.circle","arrowshape.turn.up.right.circle.fill","arrowshape.turn.up.forward","arrowshape.turn.up.forward.fill","arrowshape.turn.up.forward.circle","arrowshape.turn.up.forward.circle.fill","arrowshape.turn.up.left.2","arrowshape.turn.up.left.2.fill","arrowshape.turn.up.left.2.circle","arrowshape.turn.up.left.2.circle.fill","arrowshape.turn.up.backward.2","arrowshape.turn.up.backward.2.fill","arrowshape.turn.up.backward.2.circle","arrowshape.turn.up.backward.2.circle.fill","arrowshape.zigzag.right","arrowshape.zigzag.right.fill","arrowshape.zigzag.forward","arrowshape.zigzag.forward.fill","arrowshape.bounce.right","arrowshape.bounce.right.fill","arrowshape.bounce.forward","arrowshape.bounce.forward.fill","arrow.up.heart","arrow.up.heart.fill","arrow.down.heart","arrow.down.heart.fill","location","location.fill","location.slash","location.slash.fill","location.north","location.north.fill","location.circle","location.circle.fill","location.north.line","location.north.line.fill","leaf.arrow.triangle.circlepath","arrow.down.app","arrow.down.app.fill","arrow.up.forward.app","arrow.up.forward.app.fill","arrowtriangle.left.and.line.vertical.and.arrowtriangle.right","arrowtriangle.left.fill.and.line.vertical.and.arrowtriangle.right.fill","arrowtriangle.right.and.line.vertical.and.arrowtriangle.left","arrowtriangle.right.fill.and.line.vertical.and.arrowtriangle.left.fill","chevron.left","chevron.left.circle","chevron.left.circle.fill","chevron.left.square","chevron.left.square.fill","chevron.backward","chevron.backward.circle","chevron.backward.circle.fill","chevron.backward.square","chevron.backward.square.fill","chevron.right","chevron.right.circle","chevron.right.circle.fill","chevron.right.square","chevron.right.square.fill","chevron.forward","chevron.forward.circle","chevron.forward.circle.fill","chevron.forward.square","chevron.forward.square.fill","chevron.left.2","chevron.backward.2","chevron.right.2","chevron.forward.2","chevron.up","chevron.up.circle","chevron.up.circle.fill","chevron.up.square","chevron.up.square.fill","chevron.down","chevron.down.circle","chevron.down.circle.fill","chevron.down.square","chevron.down.square.fill","chevron.up.chevron.down","chevron.compact.up","chevron.compact.down","chevron.compact.left","chevron.compact.right","arrow.left","arrow.left.circle","arrow.left.circle.fill","arrow.left.square","arrow.left.square.fill","arrow.backward","arrow.backward.circle","arrow.backward.circle.fill","arrow.backward.square","arrow.backward.square.fill","arrow.right","arrow.right.circle","arrow.right.circle.fill","arrow.right.square","arrow.right.square.fill","arrow.forward","arrow.forward.circle","arrow.forward.circle.fill","arrow.forward.square","arrow.forward.square.fill","arrow.up","arrow.up.circle","arrow.up.circle.fill","arrow.up.square","arrow.up.square.fill","arrow.down","arrow.down.circle","arrow.down.circle.fill","arrow.down.square","arrow.down.square.fill","arrow.up.left","arrow.up.left.circle","arrow.up.left.circle.fill","arrow.up.left.square","arrow.up.left.square.fill","arrow.up.backward","arrow.up.backward.circle","arrow.up.backward.circle.fill","arrow.up.backward.square","arrow.up.backward.square.fill","arrow.up.right","arrow.up.right.circle","arrow.up.right.circle.fill","arrow.up.right.square","arrow.up.right.square.fill","arrow.up.forward","arrow.up.forward.circle","arrow.up.forward.circle.fill","arrow.up.forward.square","arrow.up.forward.square.fill","arrow.down.left","arrow.down.left.circle","arrow.down.left.circle.fill","arrow.down.left.square","arrow.down.left.square.fill","arrow.down.backward","arrow.down.backward.circle","arrow.down.backward.circle.fill","arrow.down.backward.square","arrow.down.backward.square.fill","arrow.down.right","arrow.down.right.circle","arrow.down.right.circle.fill","arrow.down.right.square","arrow.down.right.square.fill","arrow.down.forward","arrow.down.forward.circle","arrow.down.forward.circle.fill","arrow.down.forward.square","arrow.down.forward.square.fill","arrow.left.arrow.right","arrow.left.arrow.right.circle","arrow.left.arrow.right.circle.fill","arrow.left.arrow.right.square","arrow.left.arrow.right.square.fill","arrow.up.arrow.down","arrow.up.arrow.down.circle","arrow.up.arrow.down.circle.fill","arrow.up.arrow.down.square","arrow.up.arrow.down.square.fill","arrow.turn.down.left","arrow.turn.up.left","arrow.turn.down.right","arrow.turn.up.right","arrow.turn.right.up","arrow.turn.left.up","arrow.turn.right.down","arrow.turn.left.down","arrow.uturn.left","arrow.uturn.left.circle","arrow.uturn.left.circle.fill","arrow.uturn.left.circle.badge.ellipsis","arrow.uturn.left.square","arrow.uturn.left.square.fill","arrow.uturn.backward","arrow.uturn.backward.circle","arrow.uturn.backward.circle.fill","arrow.uturn.backward.circle.badge.ellipsis","arrow.uturn.backward.square","arrow.uturn.backward.square.fill","arrow.uturn.right","arrow.uturn.right.circle","arrow.uturn.right.circle.fill","arrow.uturn.right.square","arrow.uturn.right.square.fill","arrow.uturn.forward","arrow.uturn.forward.circle","arrow.uturn.forward.circle.fill","arrow.uturn.forward.square","arrow.uturn.forward.square.fill","arrow.uturn.up","arrow.uturn.up.circle","arrow.uturn.up.circle.fill","arrow.uturn.up.square","arrow.uturn.up.square.fill","arrow.uturn.down","arrow.uturn.down.circle","arrow.uturn.down.circle.fill","arrow.uturn.down.square","arrow.uturn.down.square.fill","arrow.up.and.down.and.arrow.left.and.right","arrow.up.left.and.down.right.and.arrow.up.right.and.down.left","arrow.left.and.right","arrow.left.and.right.circle","arrow.left.and.right.circle.fill","arrow.left.and.right.square","arrow.left.and.right.square.fill","arrow.up.and.down","arrow.up.and.down.circle","arrow.up.and.down.circle.fill","arrow.up.and.down.square","arrow.up.and.down.square.fill","arrow.left.to.line.alt","arrow.left.to.line","arrow.right.to.line.alt","arrow.right.to.line","arrow.up.to.line.alt","arrow.up.to.line","arrow.down.to.line.alt","arrow.down.to.line","arrow.clockwise","arrow.clockwise.circle","arrow.clockwise.circle.fill","arrow.counterclockwise","arrow.counterclockwise.circle","arrow.counterclockwise.circle.fill","arrow.up.left.and.arrow.down.right","arrow.up.left.and.arrow.down.right.circle","arrow.up.left.and.arrow.down.right.circle.fill","arrow.up.backward.and.arrow.down.forward","arrow.up.backward.and.arrow.down.forward.circle","arrow.up.backward.and.arrow.down.forward.circle.fill","arrow.down.right.and.arrow.up.left","arrow.down.right.and.arrow.up.left.circle","arrow.down.right.and.arrow.up.left.circle.fill","arrow.down.forward.and.arrow.up.backward","arrow.down.forward.and.arrow.up.backward.circle","arrow.down.forward.and.arrow.up.backward.circle.fill","return","arrow.2.squarepath","arrow.triangle.2.circlepath","arrow.triangle.2.circlepath.circle","arrow.triangle.2.circlepath.circle.fill","exclamationmark.arrow.triangle.2.circlepath","arrow.triangle.capsulepath","arrow.3.trianglepath","arrow.triangle.turn.up.right.diamond","arrow.triangle.turn.up.right.diamond.fill","arrow.triangle.turn.up.right.circle","arrow.triangle.turn.up.right.circle.fill","arrow.triangle.merge","arrow.triangle.swap","arrow.triangle.branch","arrow.triangle.pull","arrowtriangle.left","arrowtriangle.left.fill","arrowtriangle.left.circle","arrowtriangle.left.circle.fill","arrowtriangle.left.square","arrowtriangle.left.square.fill","arrowtriangle.backward","arrowtriangle.backward.fill","arrowtriangle.backward.circle","arrowtriangle.backward.circle.fill","arrowtriangle.backward.square","arrowtriangle.backward.square.fill","arrowtriangle.right","arrowtriangle.right.fill","arrowtriangle.right.circle","arrowtriangle.right.circle.fill","arrowtriangle.right.square","arrowtriangle.right.square.fill","arrowtriangle.forward","arrowtriangle.forward.fill","arrowtriangle.forward.circle","arrowtriangle.forward.circle.fill","arrowtriangle.forward.square","arrowtriangle.forward.square.fill","arrowtriangle.up","arrowtriangle.up.fill","arrowtriangle.up.circle","arrowtriangle.up.circle.fill","arrowtriangle.up.square","arrowtriangle.up.square.fill","arrowtriangle.down","arrowtriangle.down.fill","arrowtriangle.down.circle","arrowtriangle.down.circle.fill","arrowtriangle.down.square","arrowtriangle.down.square.fill"
//        ],
//        "Indices": [
//            "questionmark.circle","questionmark.circle.fill","questionmark.square","questionmark.square.fill","exclamationmark.circle","exclamationmark.circle.fill","exclamationmark.square","exclamationmark.square.fill","a.circle","a.circle.fill","a.square","a.square.fill","b.circle","b.circle.fill","b.square","b.square.fill","c.circle","c.circle.fill","c.square","c.square.fill","d.circle","d.circle.fill","d.square","d.square.fill","e.circle","e.circle.fill","e.square","e.square.fill","f.circle","f.circle.fill","f.square","f.square.fill","g.circle","g.circle.fill","g.square","g.square.fill","h.circle","h.circle.fill","h.square","h.square.fill","i.circle","i.circle.fill","i.square","i.square.fill","j.circle","j.circle.fill","j.square","j.square.fill","k.circle","k.circle.fill","k.square","k.square.fill","l.circle","l.circle.fill","l.square","l.square.fill","m.circle","m.circle.fill","m.square","m.square.fill","n.circle","n.circle.fill","n.square","n.square.fill","o.circle","o.circle.fill","o.square","o.square.fill","p.circle","p.circle.fill","p.square","p.square.fill","q.circle","q.circle.fill","q.square","q.square.fill","r.circle","r.circle.fill","r.square","r.square.fill","s.circle","s.circle.fill","s.square","s.square.fill","t.circle","t.circle.fill","t.square","t.square.fill","u.circle","u.circle.fill","u.square","u.square.fill","v.circle","v.circle.fill","v.square","v.square.fill","w.circle","w.circle.fill","w.square","w.square.fill","x.circle","x.circle.fill","x.square","x.square.fill","y.circle","y.circle.fill","y.square","y.square.fill","z.circle","z.circle.fill","z.square","z.square.fill","dollarsign.circle","dollarsign.circle.fill","dollarsign.square","dollarsign.square.fill","centsign.circle","centsign.circle.fill","centsign.square","centsign.square.fill","yensign.circle","yensign.circle.fill","yensign.square","yensign.square.fill","sterlingsign.circle","sterlingsign.circle.fill","sterlingsign.square","sterlingsign.square.fill","francsign.circle","francsign.circle.fill","francsign.square","francsign.square.fill","florinsign.circle","florinsign.circle.fill","florinsign.square","florinsign.square.fill","turkishlirasign.circle","turkishlirasign.circle.fill","turkishlirasign.square","turkishlirasign.square.fill","rublesign.circle","rublesign.circle.fill","rublesign.square","rublesign.square.fill","eurosign.circle","eurosign.circle.fill","eurosign.square","eurosign.square.fill","dongsign.circle","dongsign.circle.fill","dongsign.square","dongsign.square.fill","indianrupeesign.circle","indianrupeesign.circle.fill","indianrupeesign.square","indianrupeesign.square.fill","tengesign.circle","tengesign.circle.fill","tengesign.square","tengesign.square.fill","pesetasign.circle","pesetasign.circle.fill","pesetasign.square","pesetasign.square.fill","pesosign.circle","pesosign.circle.fill","pesosign.square","pesosign.square.fill","kipsign.circle","kipsign.circle.fill","kipsign.square","kipsign.square.fill","wonsign.circle","wonsign.circle.fill","wonsign.square","wonsign.square.fill","lirasign.circle","lirasign.circle.fill","lirasign.square","lirasign.square.fill","australsign.circle","australsign.circle.fill","australsign.square","australsign.square.fill","hryvniasign.circle","hryvniasign.circle.fill","hryvniasign.square","hryvniasign.square.fill","nairasign.circle","nairasign.circle.fill","nairasign.square","nairasign.square.fill","guaranisign.circle","guaranisign.circle.fill","guaranisign.square","guaranisign.square.fill","coloncurrencysign.circle","coloncurrencysign.circle.fill","coloncurrencysign.square","coloncurrencysign.square.fill","cedisign.circle","cedisign.circle.fill","cedisign.square","cedisign.square.fill","cruzeirosign.circle","cruzeirosign.circle.fill","cruzeirosign.square","cruzeirosign.square.fill","tugriksign.circle","tugriksign.circle.fill","tugriksign.square","tugriksign.square.fill","millsign.circle","millsign.circle.fill","millsign.square","millsign.square.fill","shekelsign.circle","shekelsign.circle.fill","shekelsign.square","shekelsign.square.fill","manatsign.circle","manatsign.circle.fill","manatsign.square","manatsign.square.fill","rupeesign.circle","rupeesign.circle.fill","rupeesign.square","rupeesign.square.fill","bahtsign.circle","bahtsign.circle.fill","bahtsign.square","bahtsign.square.fill","larisign.circle","larisign.circle.fill","larisign.square","larisign.square.fill","bitcoinsign.circle","bitcoinsign.circle.fill","bitcoinsign.square","bitcoinsign.square.fill","0.circle","0.circle.fill","0.square","0.square.fill","1.circle","1.circle.fill","1.square","1.square.fill","2.circle","2.circle.fill","2.square","2.square.fill","3.circle","3.circle.fill","3.square","3.square.fill","4.circle","4.circle.fill","4.square","4.square.fill","4.alt.circle","4.alt.circle.fill","4.alt.square","4.alt.square.fill","5.circle","5.circle.fill","5.square","5.square.fill","6.circle","6.circle.fill","6.square","6.square.fill","6.alt.circle","6.alt.circle.fill","6.alt.square","6.alt.square.fill","7.circle","7.circle.fill","7.square","7.square.fill","8.circle","8.circle.fill","8.square","8.square.fill","9.circle","9.circle.fill","9.square","9.square.fill","9.alt.circle","9.alt.circle.fill","9.alt.square","9.alt.square.fill","00.circle","00.circle.fill","00.square","00.square.fill","01.circle","01.circle.fill","01.square","01.square.fill","02.circle","02.circle.fill","02.square","02.square.fill","03.circle","03.circle.fill","03.square","03.square.fill","04.circle","04.circle.fill","04.square","04.square.fill","05.circle","05.circle.fill","05.square","05.square.fill","06.circle","06.circle.fill","06.square","06.square.fill","07.circle","07.circle.fill","07.square","07.square.fill","08.circle","08.circle.fill","08.square","08.square.fill","09.circle","09.circle.fill","09.square","09.square.fill","10.circle","10.circle.fill","10.square","10.square.fill","11.circle","11.circle.fill","11.square","11.square.fill","12.circle","12.circle.fill","12.square","12.square.fill","13.circle","13.circle.fill","13.square","13.square.fill","14.circle","14.circle.fill","14.square","14.square.fill","15.circle","15.circle.fill","15.square","15.square.fill","16.circle","16.circle.fill","16.square","16.square.fill","17.circle","17.circle.fill","17.square","17.square.fill","18.circle","18.circle.fill","18.square","18.square.fill","19.circle","19.circle.fill","19.square","19.square.fill","20.circle","20.circle.fill","20.square","20.square.fill","21.circle","21.circle.fill","21.square","21.square.fill","22.circle","22.circle.fill","22.square","22.square.fill","23.circle","23.circle.fill","23.square","23.square.fill","24.circle","24.circle.fill","24.square","24.square.fill","25.circle","25.circle.fill","25.square","25.square.fill","26.circle","26.circle.fill","26.square","26.square.fill","27.circle","27.circle.fill","27.square","27.square.fill","28.circle","28.circle.fill","28.square","28.square.fill","29.circle","29.circle.fill","29.square","29.square.fill","30.circle","30.circle.fill","30.square","30.square.fill","31.circle","31.circle.fill","31.square","31.square.fill","32.circle","32.circle.fill","32.square","32.square.fill","33.circle","33.circle.fill","33.square","33.square.fill","34.circle","34.circle.fill","34.square","34.square.fill","35.circle","35.circle.fill","35.square","35.square.fill","36.circle","36.circle.fill","36.square","36.square.fill","37.circle","37.circle.fill","37.square","37.square.fill","38.circle","38.circle.fill","38.square","38.square.fill","39.circle","39.circle.fill","39.square","39.square.fill","40.circle","40.circle.fill","40.square","40.square.fill","41.circle","41.circle.fill","41.square","41.square.fill","42.circle","42.circle.fill","42.square","42.square.fill","43.circle","43.circle.fill","43.square","43.square.fill","44.circle","44.circle.fill","44.square","44.square.fill","45.circle","45.circle.fill","45.square","45.square.fill","46.circle","46.circle.fill","46.square","46.square.fill","47.circle","47.circle.fill","47.square","47.square.fill","48.circle","48.circle.fill","48.square","48.square.fill","49.circle","49.circle.fill","49.square","49.square.fill","50.circle","50.circle.fill","50.square","50.square.fill"
//        ]
]

let categoriesRainbowColors: [String: Color] = [
    "Connectivity": Color(hex: "#D82735"),
    "Devices": Color(hex: "#FF9135"),
    "Health": Color(hex: "#FFEF00"),
    "Multimedia": Color(hex: "#00CC00"),
    "Nature": Color(hex: "#06BBFC"),
    "People": Color(hex: "#0052A5"),
    "Time": Color(hex: "#69107D"),
    "smileys & people": Color(hex: "#D82735"),
    "animals & nature": Color(hex: "#FF9135"),
    "food & drink": Color(hex: "#FFEF00"),
    "activity": Color(hex: "#00CC00"),
    "travel & places": Color(hex: "#06BBFC"),
    "objects": Color(hex: "#0052A5"),
    "symbols": Color(hex: "#69107D"),
    "flags": Color(hex: "#69107D")
]



enum Category: String, CaseIterable {
  case smileysAndPeople
  case animalsAndNature
  case foodAndDrink
  case activity
  case travelAndPlaces
  case objects
  case symbols
  case flags
}

struct CategoryModel: Hashable, Identifiable, Decodable {
  var id = UUID()
  let title: String
  let emojis: [EmojiModel]

  enum CodingKeys: CodingKey {
    case title, emojis
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.title = try container.decode(String.self, forKey: .title)
    self.emojis = try container.decode([EmojiModel].self, forKey: .emojis)
  }
}

extension CategoryModel {
  var titleEmoji: String {
    guard let category = Category.allCases.first(where: { self.title == $0.displayString }) else { return  title }
    return category.emoji
  }
}

extension Category {
  var displayString: String {
    switch self {
    case .smileysAndPeople:
        return "smileys and people"
    case .animalsAndNature:
        return "animals and nature"
    case .foodAndDrink:
        return "food and drink"
    case .activity:
        return "activity"
    case .travelAndPlaces:
        return "travel and places"
    case .objects:
        return "objects"
    case .symbols:
        return "symbols"
    case .flags:
        return "flags"
    }
  }

  var emoji: String {
    switch self {
    case .smileysAndPeople:
        return "👮🏻‍♀️"
    case .animalsAndNature:
        return "🐻"
    case .foodAndDrink:
        return "🥤"
    case .activity:
        return "🚴🏻‍♂️"
    case .travelAndPlaces:
        return "⛰"
    case .objects:
        return "💡"
    case .symbols:
        return "⁉️"
    case .flags:
        return "🏳️"
    }
  }
}

extension Category: Decodable {
  enum CodingKeys: String, CodingKey {
    case smileyAndPeople = "smileys and people"
    case animalAndNature = "animals and nature"
    case foodAndDrink = "food and drink"
    case activity = "activity"
    case travelAndPlaces = "travel and places"
    case objects = "objects"
    case symbols = "symbols"
    case flags = "flags"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    if let _ = try? container.decode(String.self, forKey: .activity) {
      self = .activity
    } else if let _ = try? container.decode(String.self, forKey: .animalAndNature) {
      self = .animalsAndNature
    } else if let _ = try? container.decode(String.self, forKey: .flags) {
      self = .flags
    } else if let _ = try? container.decode(String.self, forKey: .foodAndDrink) {
      self = .foodAndDrink
    } else if let _ = try? container.decode(String.self, forKey: .objects) {
      self = .objects
    } else if let _ = try? container.decode(String.self, forKey: .smileyAndPeople) {
      self = .smileysAndPeople
    } else if let _ = try? container.decode(String.self, forKey: .symbols) {
      self = .symbols
    } else if let _ = try? container.decode(String.self, forKey: .travelAndPlaces) {
      self = .travelAndPlaces
    }
    throw "Some error"
  }
}

extension String: LocalizedError {
  public var errorDescription: String? { return self }
}

struct EmojiModel: Decodable, Hashable {
  let no: Int
  let code: String
  let emoji: String
  let description: String
  let flagged: Bool
  let keywords: [String]
  let types: [String]?
}


class Emojis: ObservableObject {
    var emojis: [String: [String]] = [:]
    var allEmojisInCategoriesWithData: [CategoryModel] = []
    var allEmojisFlattenWithData: [EmojiModel] = []
    let emojiFileName: String = "emoji"
    
    init() {
        if let settingsURL = Bundle.module.url(forResource: "emoji", withExtension: "json") {
            print(settingsURL)
        } else {
            print("nie ma emoji:(((((!!!!!!!")
        }
        
        self.allEmojisInCategoriesWithData = self.readLocalFile(forName: "emoji")!
        
        self.allEmojisFlattenWithData = self.allEmojisInCategoriesWithData.map({$0.emojis}).flatMap({$0})
        for category in self.allEmojisInCategoriesWithData {
            emojis[category.title] = []
            
            category.emojis.forEach { emoji in
                emojis[category.title]?.append(emoji.emoji)
            }
        }
        
    }
    
    func readLocalFile(forName name: String) -> [CategoryModel]? {
        let decoder = JSONDecoder()
        
            do {
                if let bundlePath = Bundle.module.path(forResource: name,
                                                     ofType: "json"),
                    let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                    
                    let res = try decoder.decode([CategoryModel].self,
                                                from: jsonData)
                    
                    
                    
                    return res
                }
            } catch {
                print(error)
            }
            
            return nil
        }
    }



final class EmojiListViewModel: ObservableObject {
  @Published var categories = [CategoryModel]()
  
    var emojis: [String: [String]] = [:]

//
//  init() {
//    guard let res = self.loadJson(filename: "emoji",
//                                  model: [CategoryModel].self)
//    else { return }
//
//    for category in res {
//        emojis[category.title] = []
//      category.emojis.forEach { [weak self] model in
////        self?.emojiTrie.insert(model)
//        emojis[category.title]?.append(model.emoji)
//      }
//    }
//
//    self.categories = res
//  }


  // MARK: - Private
  private func loadJson<E: Decodable>(filename: String, model: E.Type) -> E? {
    let decoder = JSONDecoder()
    guard let path = Bundle.main.path(forResource: filename, ofType: "json")
    else {
      return nil
    }

    do {
        let data = try Data(contentsOf: URL(string: path)!)
      let res = try decoder.decode(model,
                                  from: data)
        
        print(res)
      return res
    } catch {
      print(error)
    }

    return nil
  }
    
func readLocalFile(forName name: String) -> [CategoryModel]? {
    let decoder = JSONDecoder()
    
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                let res = try decoder.decode([CategoryModel].self,
                                            from: jsonData)
                
                
                
                return res
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
