import { BridgeComponent } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "foo"
  static targets = [ "submit2" ]

  connect() {
    super.connect()
    this.notifyBridgeOfConnect()
  }

  notifyBridgeOfConnect() {
    const somethingElse = 'abc'

    // The variable passed after connect must match the same name in Android
    this.send("connect", { somethingElse }, () => {
      this.submit2Target.click()
    })
  }

}

