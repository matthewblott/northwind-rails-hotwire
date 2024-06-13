import { BridgeComponent } from "@hotwired/strada"
import { BridgeElement } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "form"
  static targets = [ "submit" ]

  connect() {
    super.connect()
    this.notifyBridgeOfConnect()
  }

  notifyBridgeOfConnect() {
    // const submitButton = new BridgeElement(this.submitTarget)
    // const submitTitle2 = submitButton.title
    // const submitColor = submitButton.color

    const submitTitle3 = 'fubar'

    const somethingElse = 'abc'

    // The variable passed after connect must match the same name in Android
    this.send("connect", { somethingElse, submitTitle3 }, () => {
      this.submitTarget.click()
    })
  }

  // submitStart(event) {
  //   this.submitTarget.disabled = true
  //   this.send("submitDisabled")
  // }

  // submitEnd(event) {
  //   this.submitTarget.disabled = false
  //   this.send("submitEnabled")
  // }
}

